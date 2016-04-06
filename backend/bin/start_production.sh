#!/bin/bash
python3 manage.py migrate
gunicorn -c /app/gunicorn.conf.py wsgi:application