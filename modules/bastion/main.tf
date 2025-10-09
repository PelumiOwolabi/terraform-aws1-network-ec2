// Bastion Host module
resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name      = var.key_name
  user_data     = var.user_data
  associate_public_ip_address = true
  tags          = var.tags
}
output "bastion_instance_id" {
  value = aws_instance.bastion.id
}
output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}
