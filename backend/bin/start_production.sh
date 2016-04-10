#!/bin/bash
DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE:-conf.settings_prod}
echo djsettings:
echo $DJANGO_SETTINGS_MODULE
python3 manage.py migrate
gunicorn -c /app/gunicorn.conf.py wsgi:application