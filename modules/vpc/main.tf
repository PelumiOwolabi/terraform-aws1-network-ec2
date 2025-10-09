// VPC module
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = var.tags
}

output "vpc_id" {
  value = aws_vpc.main.id
}
