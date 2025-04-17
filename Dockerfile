FROM php:8.3-apache


RUN apt-get update && apt-get install -y \
    unzip git dnsutils whois \
    libpng-dev libjpeg-dev libonig-dev libzip-dev \
    libicu-dev libmariadb-dev libxml2-dev libc-client-dev libkrb5-dev \
    libcurl4-openssl-dev pkg-config \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install mysqli intl gd imap curl mbstring zip xml \
    && pecl install mailparse \
    && docker-php-ext-enable mailparse \
    && a2enmod rewrite

RUN echo "upload_max_filesize = 500M\npost_max_size = 500M" > /usr/local/etc/php/conf.d/uploads.ini

COPY . /var/www/html

WORKDIR /var/www/html

EXPOSE 80
