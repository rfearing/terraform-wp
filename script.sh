#!/bin/bash


sudo -i
yum install epel-release yum-utils wget -y
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
yum-config-manager --disable remi-php54
yum-config-manager --enable remi-php73
yum install php php-mysql -y

# REPLACE artifact URL here like:
# curl https://123.circle-artifacts.com/0/tmp/circleci-artifacts\?circle-token\=1234 -L -o wordpress.tar.gz
tar -xzvf wordpress.tar.gz --directory /var/www/html/
chown -R apache:apache /var/www/html
systemctl restart httpd