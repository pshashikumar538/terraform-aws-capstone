variable "vpc_id" {
  description = "VPC ID where security group will be created"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH"
  type        = string
}
