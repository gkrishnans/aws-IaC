# Route table: attach Internet Gateway 
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_terraform.id
  }
  tags = {
    Name = "public_route_table"
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "subnets_public_associations" {
  count = length(var.subnets_cidr_public)
  subnet_id      = element(aws_subnet.public_subnet.*.id,count.index)
  route_table_id = aws_route_table.public_route_table.id
}

//------------------------------------------------------------

# Route table: 

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc_terraform.id
  tags = {
    Name = "private_route_table"
  }
}

# Route table association with private subnets
resource "aws_route_table_association" "subnets_private_associations" {
  count = length(var.subnets_cidr_private)
  subnet_id      = element(aws_subnet.private_subnet.*.id,count.index)
  route_table_id = aws_route_table.private_route_table.id
}
