#!/bin/bash

# source .tfvars

sudo -i
yum install epel-release yum-utils wget -y
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
yum-config-manager --disable remi-php54
yum-config-manager --enable remi-php73
yum install php php-mysql -y

## Replace Artifact URL:
# curl https://....circle-artifacts.com/0/tmp/circleci-artifacts\?circle-token=... -L -o wordpress.tar.gz

## If we can get vars working:
# curl "${artifact}" -L -o wordpress.tar.gz

tar -xzvf wordpress.tar.gz --directory /var/www/html/
chown -R apache:apache /var/www/html
systemctl restart httpd