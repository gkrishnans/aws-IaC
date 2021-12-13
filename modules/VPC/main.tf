//////////////////////////////////////////
# Create a VPC
//////////////////////////////////////////


resource "aws_vpc" "gokul_vpc_terraform" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "gokul_vpc_terraform"
  }
}
