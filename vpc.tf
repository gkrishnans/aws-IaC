//////////////////////////////////////////
# Create a VPC
//////////////////////////////////////////


resource "aws_vpc" "gokul_vpc_terraform" {
  cidr_block = "108.0.0.0/16"
  tags = {
    Name = "gokul_vpc_terraform"
  }
}
