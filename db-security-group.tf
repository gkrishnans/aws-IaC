resource "aws_security_group" "gokul_aws_security_group_terraform" {
  name        = "gokul_aws_security_group_terraform"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.gokul_vpc_terraform.id
  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.gokul_vpc_terraform.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "gokul_aws_security_group_terraform"
  }
}

