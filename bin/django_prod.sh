#!/bin/bash

#run django management command in production mode

source bin/env.sh

dcprod run -e DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_PROD --rm django python3 manage.py $@