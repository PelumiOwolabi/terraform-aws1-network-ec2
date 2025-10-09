// Stage environment root module
module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.1.0.0/16"
  tags       = { Name = "stage-vpc" }
}

module "subnets" {
  source          = "../../modules/subnets"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets = ["10.1.101.0/24", "10.1.102.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
  tags            = { Name = "stage-subnet" }
}

module "security_groups" {
  source                = "../../modules/security_groups"
  name                  = "stage-sg"
  description           = "Stage security group"
  vpc_id                = module.vpc.vpc_id
  tags                  = { Name = "stage-sg" }
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
  tags                = { Name = "stage-bastion" }
}

module "ec2" {
  source              = "../../modules/ec2"
  ami                 = var.ec2_ami
  instance_type       = "t3.micro"
  subnet_id           = module.subnets.private_subnet_ids[0]
  security_group_ids  = [module.security_groups.security_group_id]
  key_name            = var.key_name
  user_data           = ""
  tags                = { Name = "stage-ec2" }
}
