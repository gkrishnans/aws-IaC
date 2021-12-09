#! /bin/bash
sudo su -
yum update
yum install -y httpd
systemctl start httpd
systemctl enable httpd
yum install -y mysql
echo "Helloworld! from gokula_krishnan" > /var/www/html/index.html

