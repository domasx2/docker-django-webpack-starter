#!/bin/bash
# stop production server

DOCKER_CONFIG_PROD=${DOCKER_CONFIG_PROD:-docker-compose.production.yml}

docker-compose  -f docker-compose.yml -f $DOCKER_CONFIG_PROD stop
echo "stopped"