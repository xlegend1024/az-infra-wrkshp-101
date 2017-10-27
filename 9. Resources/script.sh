#!/bin/bash 
apt-get -y update 

# install Apache2 
apt-get -y install apache2 

cd /var/www/html 
wget https://raw.githubusercontent.com/xlegend1024/az-infra-wrkshp-101/master/9.%20Resources/web.tar 
tar zxvf ./web.tar 