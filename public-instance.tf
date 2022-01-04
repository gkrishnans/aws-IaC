//resource "aws_instance" "instance_terraform" {
//  count         = var.instance_count
//  ami           = var.instance_ami
//  instance_type = var.instance_type
//  key_name      = var.instance_key
//  security_groups = [aws_security_group.sg-terraform.id]
//  user_data     = file("code_setup.sh")
//  subnet_id     = element(aws_subnet.public_subnet.*.id,count.index)
//  tags = {
//    Name = "instance_${count.index+1}_terraform"
//  }
//}
//
