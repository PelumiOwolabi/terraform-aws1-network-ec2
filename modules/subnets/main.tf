// Subnets module
resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id = var.vpc_id
  cidr_block = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone = var.azs[count.index]
  tags = var.tags
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id = var.vpc_id
  cidr_block = var.private_subnets[count.index]
  map_public_ip_on_launch = false
  availability_zone = var.azs[count.index]
  tags = var.tags
}
