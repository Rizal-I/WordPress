from php:7.2-apache

run docker-php-ext-install php7.2-mysqli libapache2-mod-php7.2

workdir /var/www/html

copy . .
