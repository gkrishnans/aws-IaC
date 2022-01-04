//////////////////////////////////////////
# Create a VPC
//////////////////////////////////////////


resource "aws_vpc" "vpc_terraform" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "vpc_terraform"
  }
}
