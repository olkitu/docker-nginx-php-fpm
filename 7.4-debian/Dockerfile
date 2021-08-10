FROM php:7.4-fpm-buster

ENV PHP_FPM_HEALTHCHECK_COMMIT 078ab63599a031c3995bedf7623cb7d5495f3f56

# Install Nginx
RUN BUILD_PACKAGES='git' \
    && apt-get update && apt-get install -y nginx supervisor libfcgi-bin $BUILD_PACKAGES \
    && mkdir -p /run/nginx/ \
    && rm -rf /var/log/nginx/access.log /var/log/nginx/error.log \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && cd /tmp \
    && git clone https://github.com/renatomefi/php-fpm-healthcheck.git \
    && cd php-fpm-healthcheck \
    && git checkout $PHP_FPM_HEALTHCHECK_COMMIT \
    && cp php-fpm-healthcheck /usr/local/bin/php-fpm-healthcheck \
    && chmod 700 /usr/local/bin/php-fpm-healthcheck \
    && echo "pm.status_path = /status" >> /usr/local/etc/php-fpm.d/zz-docker.conf \
    && apt-get purge -y $BUILD_PACKAGES \
    && rm -rf /var/lib/apt/lists/*

# Copy configurations
COPY configs/supervisor.conf /etc/supervisor/conf.d/supervisord.conf
COPY configs/debian-nginx-default.conf /etc/nginx/sites-enabled/default
COPY healthcheck.sh /usr/local/bin/healthcheck

EXPOSE 80 9000

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 700 /docker-entrypoint.sh \
    && sed -i 's/\r//' /docker-entrypoint.sh \
    && chmod 700 /usr/local/bin/healthcheck \
    && sed -i 's/\r//' /usr/local/bin/healthcheck
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "healthcheck" ]