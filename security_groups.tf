resource "aws_security_group" "gokul-sg-terraform" {
  name        = "gokul-sg-terraform-ec2sg"
  description = "Allow TLS inbound traffic"
  vpc_id      =  module.VPC.vpc_id
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "gokul-sg-terraform-ec2sg"
  }
}

resource "aws_security_group" "gokul_aws_rds_sg_terraform" {
  name        = "gokul_aws_rds_sg_terraform"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.VPC.vpc_id
  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = module.VPC.vpc_cidr_block
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "gokul_aws_rds_sg_terraform"
  }
}

