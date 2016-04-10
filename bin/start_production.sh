#!/bin/bash
# start production server

DOCKER_CONFIG_PROD=${DOCKER_CONFIG_PROD:-docker-compose.production.yml}
export DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE:-conf.settings_prod}

docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_PROD up -d
echo "started"