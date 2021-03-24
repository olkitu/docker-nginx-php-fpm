# Docker Nginx & PHP-FPM with Supervisor

Based Official php:fpm-alpine image: https://hub.docker.com/_/php with additional packages

* Nginx
* Supervisor

## Supported versions

* 8
* 7.4
* 7.3

## Usage

Just easily run latest version

```
docker run olkitu/docker-nginx-php-fpm
```

If you like use different version, specify it in Tags.

Browse to http://localhost and you should see phpinfo page.

To install additional PHP-modules like pdo_mysql, use instructions from Official image: https://hub.docker.com/_/php

## Source

Source: https://github.com/olkitu/docker-nginx-php-fpm