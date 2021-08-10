#!/bin/sh

# If PHP-FPM doesn't respond 0, then exit with 1
/usr/local/bin/php-fpm-healthcheck
if [ $? -ne 0 ]; then
    exit 1
fi
curl -f http://localhost/health_check
# If Nginx doesn't respond 200, then exit with 1 (error)
if [ $? -ne 0 ]; then
    exit 1
fi

# If both OK, then return 0 = success
exit 0