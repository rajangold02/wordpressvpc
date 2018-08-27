#!/bin/sh
sudo yum update -y
sudo yum install httpd -y
sudo yum install php php-mysql -y
sudo service httpd start
cd /var/www/html
sudo wget http://wordpress.org/latest.tar.gz
sudo tar -xvf latest.tar.gz
cd wordpress
sudo cp -r * .. && cd ..
mv wp-config-sample.php wp-config.php
sudo service httpd restart
