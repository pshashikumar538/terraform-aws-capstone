provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"

  environment     = "dev"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
}

module "security_groups" {
  source = "../../modules/security-groups"

  vpc_id            = module.vpc.vpc_id
  environment       = "dev"
  allowed_ssh_cidr  = "204.107.153.71/32"
}

module "ec2" {
  source = "../../modules/ec2"

  environment       = "dev"
  subnet_id          = module.vpc.private_subnet_ids[0]
  security_group_id = module.security_groups.web_sg_id
  instance_type     = "t3.micro"
  ami_id            = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
}

module "alb" {
  source = "../../modules/alb"

  environment          = "dev"
  vpc_id               = module.vpc.vpc_id
  public_subnet_ids    = module.vpc.public_subnet_ids
  target_instance_id   = module.ec2.instance_id
}
