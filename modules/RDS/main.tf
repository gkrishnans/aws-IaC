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
  vpc_security_group_ids = var.vpc_security_group_ids
}

resource "aws_db_subnet_group" "gokul_db_subnet_group_terraform" {
  name       = "gokul_db_subnet_group_terraform"
  subnet_ids = [for sub in var.private-subnets :sub]
  tags = {
    Name = "gokul_db_subnet_group_terraform"
  }
}



