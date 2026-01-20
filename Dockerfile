
FROM php:7.2-apache

# Instalar dependencias inseguras a propósito
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    mariadb-client \
 && docker-php-ext-install mysqli pdo pdo_mysql \
 && rm -rf /var/lib/apt/lists/*

# Habilitar Apache mods
RUN a2enmod rewrite

# Descargar DVWA
WORKDIR /var/www/html
RUN rm -rf * && \
    git clone https://github.com/digininja/DVWA.git .

# Set permisos inseguros (a propósito)
RUN chmod -R 777 /var/www/html

# Config DVWA
COPY config.inc.php /var/www/html/config/config.inc.php

EXPOSE 80
Add insecure DVWA Dockerfile
