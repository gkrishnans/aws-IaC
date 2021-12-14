resource "aws_db_instance" "default" {
  allocated_storage    = 20
  identifier           = "gokul-aws-db-instance"
  engine               = "mysql"
  engine_version       = "8.0.23"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "gokul"
  password             = "gokuldb!!!1234"
  port                 = "3306"
  db_subnet_group_name = aws_db_subnet_group.gokul_db_subnet_group_terraform.name
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.gokul_aws_security_group_terraform.id]
}

resource "aws_db_subnet_group" "gokul_db_subnet_group_terraform" {
  name       = "gokul_db_subnet_group_terraform"
  subnet_ids = var.private-subnets
  tags = {
    Name = "gokul_db_subnet_group_terraform"
  }
}



resource "aws_security_group" "gokul_aws_security_group_terraform" {
  name        = "gokul_aws_security_group_terraform"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["108.0.0.0/16"]
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






