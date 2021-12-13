//resource "aws_instance" "gokul_instance_terraform" {
//  count         = var.instance_count
//  ami           = var.instance_ami
//  instance_type = var.instance_type
//  key_name      = var.instance_key
//  security_groups = [aws_security_group.gokul-sg-terraform.id]
//  user_data     = file("code_setup.sh")
//  subnet_id     = element(aws_subnet.gokul_public_subnet.*.id,count.index)
//  tags = {
//    Name = "gokul_instance_${count.index+1}_terraform"
//  }
//}
//
