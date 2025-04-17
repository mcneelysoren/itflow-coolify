FROM php:8.3-apache

# Install required system packages and PHP build dependencies
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    dnsutils \
    whois \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libzip-dev \
    libicu-dev \
    libmariadb-dev \
    libxml2-dev \
    libc-client-dev \
    libkrb5-dev \
    libcurl4-openssl-dev \
    pkg-config \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install \
        mysqli \
        intl \
        gd \
        imap \
        curl \
        mbstring \
        zip \
        xml \
    && pecl install mailparse \
    && docker-php-ext-enable mailparse

# Enable Apache modules
RUN a2enmod rewrite

# Set PHP limits for ITFlow
RUN echo "upload_max_filesize = 500M\npost_max_size = 500M" > /usr/local/etc/php/conf.d/uploads.ini

# Copy source files
COPY . /var/www/html
# COPY ./config.php /var/www/html/config.php

# Fix permissions
RUN if [ -f /var/www/html/config.php ]; then \
        chown www-data:www-data /var/www/html/config.php && \
        chmod 644 /var/www/html/config.php; \
    fi

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html

# Set working directory
WORKDIR /var/www/html

EXPOSE 80
