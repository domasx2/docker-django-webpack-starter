#!/bin/bash

#run django management command in production mode

export DOCKER_CONFIG_PROD=${DOCKER_CONFIG_PROD:-docker-compose.production.yml}
export DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE:-conf.settings_prod}

docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_PROD run -e DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE --rm django python3 manage.py $@