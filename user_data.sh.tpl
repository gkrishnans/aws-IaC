#! /bin/bash
sudo yum update -y
sudo yum install git -y
sudo yum update -y
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb-server
sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
cd /var/www/html
git clone https://github.com/gkrishnans/php-mysql-app.git
sudo mv /var/www/html/php-mysql-app/* /var/www/html/
echo ${dbhost} > dbhost.txt                            
echo ${dbusername} > dbusername.txt
echo ${dbpassword} > dbpassword.txt                 
sudo mysql -h ${dbhost} -u ${dbusername} -P 3306 -p ${dbpassword} < initsql.sql
