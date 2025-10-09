# terraform-aws-network-ec2

## Overview
This repo demonstrates AWS VPC design, subnet segmentation, security groups, bastion host, and EC2 provisioning using Terraform. It includes remote state management and CI/CD workflows for plan/apply with manual approval.

## Structure
- `modules/` — reusable Terraform modules:
  - `vpc/`
  - `subnets/`
  - `security_groups/`
  - `ec2/`
  - `bastion/`
- `envs/dev/` and `envs/stage/` — environment-specific root modules
- GitHub Actions workflows for CI
- S3 remote state + DynamoDB state lock

## Getting Started
1. Configure AWS credentials.
2. Set up S3 bucket and DynamoDB table for remote state.
3. Edit variables in `envs/dev/` and `envs/stage/`.
4. Run `terraform init`, `plan`, and `apply` in the desired environment folder.

## Remote State Example
```
terraform {
  backend "s3" {
    bucket         = "<your-bucket-name>"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "<your-lock-table>"
    encrypt        = true
  }
}
```

## SSH Example (via Bastion)
```
ssh -i <your-key.pem> ec2-user@<bastion-public-ip> -J ec2-user@<private-ec2-ip>
```

## CI/CD
- `terraform-plan.yml`: runs on PR, shows plan
- `terraform-apply.yml`: runs on merge to main or manual trigger, applies changes

## Outputs
See `outputs.md` for details.

## Architecture
See `architecture.png` or `architecture.svg` for diagram.
