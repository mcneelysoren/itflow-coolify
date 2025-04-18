#!/bin/bash

echo "[entrypoint] Starting container..."

if [ -f /var/www/html/config.php ]; then
    echo "[entrypoint] config.php found — fixing permissions..."
    echo "[entrypoint] BEFORE:"
    ls -l /var/www/html/config.php

    chown www-data:www-data /var/www/html/config.php
    chmod 644 /var/www/html/config.php

    echo "[entrypoint] AFTER:"
    ls -l /var/www/html/config.php
else
    echo "[entrypoint] config.php not found."
fi

exec apache2-foreground
