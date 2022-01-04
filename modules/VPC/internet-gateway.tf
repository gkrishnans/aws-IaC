resource "aws_internet_gateway" "internet_gateway_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = {
    Name = "vpc_terraform"
  }
}