resource "aws_internet_gateway" "gokul_internet_gateway_terraform" {
  vpc_id = aws_vpc.gokul_vpc_terraform.id

  tags = {
    Name = "gokul_vpc_terraform"
  }
}