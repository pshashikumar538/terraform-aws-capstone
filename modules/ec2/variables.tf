variable "environment" {
  type = string
}

variable "subnet_id" {
  description = "Subnet to launch EC2 in"
  type        = string
}

variable "security_group_id" {
  description = "Security group for EC2"
  type        = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}
