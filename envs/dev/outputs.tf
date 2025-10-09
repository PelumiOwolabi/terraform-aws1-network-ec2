output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnet_ids" {
  value = module.subnets.public_subnet_ids
}
output "private_subnet_ids" {
  value = module.subnets.private_subnet_ids
}
output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}
output "ec2_public_ip" {
  value = module.ec2.public_ip
}
