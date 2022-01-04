resource "aws_subnet" "public_subnet" {
  count = length(var.subnets_cidr_public)
  vpc_id = aws_vpc.vpc_terraform.id
  cidr_block = element(var.subnets_cidr_public,count.index)
  availability_zone = element(var.azs_public,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet_public_${count.index+1}_terraform"
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.subnets_cidr_private)
  vpc_id = aws_vpc.vpc_terraform.id
  cidr_block = element(var.subnets_cidr_private,count.index)
  availability_zone = element(var.azs_private,count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "subnet_private_${count.index+1}_terraform"
  }
}

