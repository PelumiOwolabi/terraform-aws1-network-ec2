// EC2 module
resource "aws_instance" "main" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name      = var.key_name
  user_data     = var.user_data
  tags          = var.tags
}
output "instance_id" {
  value = aws_instance.main.id
}
output "public_ip" {
  value = aws_instance.main.public_ip
}
