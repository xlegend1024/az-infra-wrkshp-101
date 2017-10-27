#!/bin/bash 
apt-get -y update 

# install Apache2 
apt-get -y install apache2 

cd /var/www/html 
wget http://webinarhub.blob.core.windows.net/javaonazure/web.tar 
tar zxvf ./web.tar 