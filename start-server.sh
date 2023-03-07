#!/usr/bin/env bash
set -e
# start-server.sh
if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    (cd /opt/app/; python manage.py createsuperuser --no-input)
fi

cd /opt/app/
gunicorn search_api.wsgi --bind 0.0.0.0:8010 --workers 3 --preload --timeout 90