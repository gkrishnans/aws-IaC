resource "aws_instance" "gokul_instance_terraform" {
  count            = var.instance_count
  ami              = var.instance_ami
  instance_type    = var.instance_type
  key_name         = var.instance_key
  security_groups  = var.sg-terraform
  user_data        = file("code_setup.sh")
  subnet_id        = element(var.public-subnets, count.index)
  tags             = {
    Name = "gokul_instance_${count.index+1}_terraform"
  }
}