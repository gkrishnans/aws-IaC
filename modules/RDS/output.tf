  vpc_security_group_ids = [aws_security_group.gokul_aws_rds_sg_terraform.id]

  subnet_ids = [for sub in aws_subnet.gokul_private_subnet[*].id:sub]

