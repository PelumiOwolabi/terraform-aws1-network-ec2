variable "ec2_ami" { type = string }
variable "key_name" { type = string }
variable "bastion_ami" {
  description = "AMI ID for the bastion host"
  type        = string
  default     = "ami-08c40ec9ead489470" # Example Amazon Linux 2 AMI for us-east-1
}