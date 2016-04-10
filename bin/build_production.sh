#!/bin/bash

#builds production images

DOCKER_CONFIG_PROD=${DOCKER_CONFIG_PROD:-docker-compose.production.yml}

./bin/build_frontend.sh
cp ./frontend/dist/assets.json ./backend/
docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_PROD build
rm ./backend/assets.json