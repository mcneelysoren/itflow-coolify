FROM php:8.1-apache

# Install system tools and PHP extensions
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

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set upload limits
RUN echo "upload_max_filesize = 500M\npost_max_size = 500M" > /usr/local/etc/php/conf.d/uploads.ini

# Copy source code
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html

EXPOSE 80
