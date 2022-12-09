#!/bin/bash
sudo yum install httpd wget unzip epel-release mysql -y
sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum -y install yum-utils
sudo yum-config-manager --enable remi-php56   [Install PHP 5.6]
sudo yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xf latest.tar.gz -C /var/www/html/
sudo mv /var/www/html/wordpress/* /var/www/html/
sudo cp /var/www/html/wp-config-sample.php  /var/www/html/wp-config.php 
sudo sed 's/database_name_here/db-team2sql/g' /var/www/html/wp-config.php -i
sudo sed 's/username_here/wordpress@team2sql/g' /var/www/html/wp-config.php -i
sudo sed 's/password_here/W0rdpr3ss@p4ss/g' /var/www/html/wp-config.php -i
sudo sed 's/localhost/team2sql.mysql.database.azure.com/g' /var/www/html/wp-config.php -i
#DBNAME="db-wordpress"
sudo getenforce
sudo sed 's/SELINUX=permissive/SELINUX=enforcing/g' /etc/sysconfig/selinux -i
sudo setenforce 0
sudo chown -R apache:apache /var/www/html/
sudo systemctl start httpd
sudo systemctl enable httpd

#DB_SERVER_NAME="team@sql-whynot"


#export WORDPRESS_DB_HOST= "${DB_SERVER_NAME}.mysql.database.azure.com"
#export WORDPRESS_DB_USER= "wordpress@${DB_SERVER_NAME}"
#export WORDPRESS_DB_PASSWORD= "W0rdpr3ss@p4ss"
#export WORDPRESS_DB_NAME= "${DBNAME}"
