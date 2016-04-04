#!/bin/bash
# start production server

DOCKER_CONFIG=${DOCKER_CONFIG:-docker-compose-prod.yml}
docker-compose -f $DOCKER_CONFIG up -d
echo "started"