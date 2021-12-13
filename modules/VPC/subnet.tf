resource "aws_subnet" "gokul_public_subnet" {
  count = length(var.subnets_cidr_public)
  vpc_id = aws_vpc.gokul_vpc_terraform.id
  cidr_block = element(var.subnets_cidr_public,count.index)
  availability_zone = element(var.azs_public,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "gokul_subnet_public_${count.index+1}_terraform"
  }
}

resource "aws_subnet" "gokul_private_subnet" {
  count = length(var.subnets_cidr_private)
  vpc_id = aws_vpc.gokul_vpc_terraform.id
  cidr_block = element(var.subnets_cidr_private,count.index)
  availability_zone = element(var.azs_private,count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "gokul_subnet_private_${count.index+1}_terraform"
  }
}

