FROM php:8.1-apache

RUN docker-php-ext-install mysqli && \
    a2enmod rewrite

COPY . /var/www/html

WORKDIR /var/www/html

EXPOSE 80
