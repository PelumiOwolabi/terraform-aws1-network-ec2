# Terraform Outputs

## VPC
- VPC ID

## Subnets
- Public Subnet IDs
- Private Subnet IDs

## Security Groups
- Security Group ID

## Bastion Host
- Bastion Instance ID
- Bastion Public IP

## EC2 Instance
- EC2 Instance ID
- EC2 Public IP (if public)

## Example SSH Command
```
ssh -i <your-key.pem> ec2-user@<bastion-public-ip> -J ec2-user@<private-ec2-ip>
```
