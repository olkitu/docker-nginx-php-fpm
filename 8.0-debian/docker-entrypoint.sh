#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf "$@"
fi

exec "$@"