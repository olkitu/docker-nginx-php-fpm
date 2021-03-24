ARG PHP_VERSION
ARG ALPINE_VERSION

FROM php:${PHP_VERSION}-fpm-alpine${ALPINE_VERSION}

# Install Nginx
RUN apk add --no-cache nginx supervisor \
    && mkdir /run/nginx/ \
    && rm -rf /var/log/nginx/access.log /var/log/nginx/error.log \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Copy configurations
COPY configs/supervisor.conf /etc/supervisor/conf.d/supervisord.conf
COPY configs/nginx-default.conf /etc/nginx/conf.d/default.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 700 /docker-entrypoint.sh \
    && sed -i 's/\r//' /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]