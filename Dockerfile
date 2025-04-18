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

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set PHP upload limits
RUN echo "upload_max_filesize = 500M\npost_max_size = 500M" > /usr/local/etc/php/conf.d/uploads.ini

# Copy application code
COPY . /var/www/html

# Fix general app permissions (for uploads, storage, etc.)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html

# Force container to run as root (so we can fix mounted config.php on startup)
USER root

# Runtime fix for config.php permissions and start Apache
CMD ["bash", "-c", "\
  if [ -f /var/www/html/config.php ]; then \
    echo '[startup] Fixing config.php permissions...'; \
    chown www-data:www-data /var/www/html/config.php && \
    chmod 644 /var/www/html/config.php; \
  fi && \
  apache2-foreground"]
