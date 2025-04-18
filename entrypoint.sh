#!/bin/bash

# Fix permission on config.php if it exists
if [ -f /var/www/html/config.php ]; then
    echo "[entrypoint] Fixing permissions on config.php..."
    chown www-data:www-data /var/www/html/config.php
    chmod 644 /var/www/html/config.php
fi

# Start Apache (default CMD)
exec apache2-foreground
