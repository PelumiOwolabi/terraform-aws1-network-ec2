// Dev environment root module
module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
  tags       = { Name = "dev-vpc" }
}

module "subnets" {
  source          = "../../modules/subnets"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
  tags            = { Name = "dev-subnet" }
}

module "security_groups" {
  source                = "../../modules/security_groups"
  name                  = "dev-sg"
  description           = "Dev security group"
  vpc_id                = module.vpc.vpc_id
  tags                  = { Name = "dev-sg" }
  ingress_from_port     = 22
  ingress_to_port       = 22
  ingress_protocol      = "tcp"
  ingress_cidr_blocks   = ["0.0.0.0/0"]
  egress_from_port      = 0
  egress_to_port        = 0
  egress_protocol       = "-1"
  egress_cidr_blocks    = ["0.0.0.0/0"]
}

module "bastion" {
  source              = "../../modules/bastion"
  ami                 = var.bastion_ami
  instance_type       = "t3.micro"
  subnet_id           = module.subnets.public_subnet_ids[0]
  security_group_ids  = [module.security_groups.security_group_id]
  key_name            = var.key_name
  user_data           = ""
  tags                = { Name = "dev-bastion" }
}

module "ec2" {
  source              = "../../modules/ec2"
  ami                 = var.ec2_ami
  instance_type       = "t3.micro"
  subnet_id           = module.subnets.private_subnet_ids[0]
  security_group_ids  = [module.security_groups.security_group_id]
  key_name            = var.key_name
  user_data           = ""
  tags                = { Name = "dev-ec2" }
}
