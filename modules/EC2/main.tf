# resource "aws_instance" "gokul_instance_terraform" {
  # count            = var.instance_count
  # ami              = var.instance_ami
  # instance_type    = var.instance_type
  # key_name         = var.instance_key
  # security_groups  = var.sg-terraform
  # //user_data        = file("code_setup.sh")
  # 
  # user_data        = <<EOT
                          //! /bin/bash
                          # sudo yum update -y
                          # sudo yum install git -y
                          # sudo yum update -y
                          # sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
                          # sudo yum install -y httpd mariadb-server
                          # sudo systemctl start httpd
                          # sudo systemctl enable httpd
                          # sudo usermod -a -G apache ec2-user
                          # sudo chown -R ec2-user:apache /var/www
                          # sudo chmod 2775 /var/www
                          # cd /var/www/html
                          # git clone https://github.com/gkrishnans/php-mysql-app.git
                          # sudo mv /var/www/html/php-mysql-app/* /var/www/html/
                          # echo ${var.dbhost} > dbhost.txt                            
                          # echo ${var.dbusername} > dbusername.txt
                          # echo ${var.dbpassword} > dbpassword.txt                 
                          # mysql -h ${var.dbhost} -u ${var.dbusername} -p ${var.dbpassword} < initsql.sql
                      #  EOT
  # subnet_id        = element(var.public-subnets, count.index)
  # tags             = {
    # Name = "gokul_instance_${count.index+1}_terraform"
  # }
# }
# 

//${data.template_file.init.rendered}

data "template_file" "user_data" {
  template = "${file("user_data.sh.tpl")}"
  vars = {
    dbhost = "${var.dbhost}"
    dbusername = "${var.dbusername}"
    dbpassword = "${var.dbpassword}"
  }
}

resource "aws_instance" "gokul_instance_terraform" {
  count            = var.instance_count
  ami              = var.instance_ami
  instance_type    = var.instance_type
  key_name         = var.instance_key
  security_groups  = var.sg-terraform
  user_data = templatefile("user_data.sh.tpl",{
      dbhost = "${var.dbhost}",
      dbusername = var.dbusername,
      dbpassword = var.dbpassword
  })  
  subnet_id        = element(var.public-subnets, count.index)
  tags             = {
    Name = "gokul_instance_${count.index+1}_terraform"
  }
}