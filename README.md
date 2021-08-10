# Docker Nginx & PHP-FPM with Supervisor

![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/olkitu/docker-nginx-php-fpm/Build%20and%20Push%20to%20DockerHub/main) ![GitHub](https://img.shields.io/github/license/olkitu/docker-nginx-php-fpm)

Based Official PHP image: https://hub.docker.com/_/php with additional packages:

* Nginx
* Supervisor
* [renatomefi/php-fpm-healthcheck](https://github.com/renatomefi/php-fpm-healthcheck)

This repository will automatically update weekly.

## Supported PHP versions

Alpine:

* 8: `8.0`, `8`, `latest`
* 7.4: `7.4`, `7`
* 7.3: `7.3`

Debian Buster:

* 8: `8.0-buster`, `8-buster`, `latest-buster`
* 7.4: `7.4-buster`, `7-buster`
* 7.3: `7.3-buster`

Check from Tags all supported versions and architechtures.

## Usage

Run latest version

```
docker run --name nginx-php-fpm -v /some/content:/var/www/html:ro -d ghcr.io/olkitu/olkitu/docker-nginx-php-fpm
```

Run specific version, example 7.4

```
docker run --name nginx-php-fpm -v /some/content:/var/www/html:ro -d ghcr.io/olkitu/docker-nginx-php-fpm:7.4
```

## Production image

To build image to production create `Dockerfile` to specify your own configuration. 

```Dockerfile
# Use olkitu/docker-nginx-php-fpm image
FROM ghcr.io/olkitu/docker-nginx-php-fpm:7.4

# Use production php.ini configuration and hide PHP-version
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    && sed -i -e 's/expose_php = On/expose_php = Off/' /usr/local/etc/php/php.ini

# Do other changes like copy website files to image with COPY: https://docs.docker.com/engine/reference/builder/#copy
```

## License

[MIT](https://github.com/olkitu/docker-nginx-php-fpm/blob/main/LICENSE)

## Source

Source: https://github.com/olkitu/docker-nginx-php-fpm