
FROM php:7.2-apache

# Fix repos Debian Buster archivados
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list \
 && sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list \
 && echo 'Acquire::Check-Valid-Until "0";' > /etc/apt/apt.conf.d/99no-check-valid-until \
 && apt-get update

RUN apt-get install -y \
    git unzip libpng-dev libjpeg-dev libonig-dev libxml2-dev mariadb-client \
 && docker-php-ext-install mysqli pdo pdo_mysql \
 && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite
WORKDIR /var/www/html
RUN rm -rf * && git clone https://github.com/digininja/DVWA.git .
RUN chmod -R 777 /var/www/html
COPY config.inc.php /var/www/html/config/config.inc.php

EXPOSE 80
