# Docker Nginx & PHP-FPM with Supervisor

Based Official PHP image: https://hub.docker.com/_/php with additional packages:

* Nginx
* Supervisor

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
docker run --name nginx-php-fpm -v /some/content:/var/www/html:ro -d olkitu/docker-nginx-php-fpm
```

Run specific version, example 7.4

```
docker run --name nginx-php-fpm -v /some/content:/var/www/html:ro -d olkitu/docker-nginx-php-fpm:7.4
```

It's recommended create `Dockerfile` and build own custom image. You can install to custom image also additional PHP-modules like pdo_mysql. 

## Source

Source: https://github.com/olkitu/docker-nginx-php-fpm