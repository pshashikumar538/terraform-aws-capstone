# Terraform AWS Capstone Project

This repository contains a Terraform-based AWS infrastructure setup following DevOps best practices.  
It demonstrates Infrastructure as Code (IaC), modular Terraform design, and environment separation.

---

## Project Overview

The purpose of this project is to:
- Provision AWS infrastructure using Terraform
- Support multiple environments like dev and prod
- Follow DevOps and IaC best practices
- Be suitable for CI/CD automation

---

## Project Structure

terraform-aws-capstone/
├── dev/
├── prod/
├── modules/
│   ├── vpc/
│   ├── asg/
│   └── alb/
├── .gitignore
└── README.md

---

## Prerequisites

Before running this project, ensure you have:

- Terraform (version 1.x or later)
- AWS CLI
- Git
- An AWS account with valid credentials

---

## AWS Authentication

Configure AWS credentials using:

aws configure

Or by using AWS profiles and environment variables.

---

## How to Use

Initialize Terraform for dev environment:

terraform -chdir=dev init

Generate execution plan:

terraform -chdir=dev plan

Apply infrastructure changes:

terraform -chdir=dev apply

Destroy infrastructure:

terraform -chdir=dev destroy

---

## Environments

Each environment is isolated and managed separately.

- dev: Development and testing
- prod: Production environment

---

## Modules

This project uses reusable Terraform modules:

- VPC module for networking
- ASG module for compute resources
- ALB module for load balancing

Modules promote reusability and clean design.

---

## Best Practices Followed

- Infrastructure as Code (IaC)
- Modular Terraform structure
- No hardcoded secrets
- Terraform state files are ignored via .gitignore
- Environment separation
- Least privilege IAM access

---

## Notes

- Terraform state files are not committed to Git
- This project is intended for learning and demonstration
- Suitable for CI/CD integration

---

## Author

Shashi 
DevOps Engineer

---

## License

This project is for educational and demonstration purposes.
