#!/bin/bash
export DOCKER_CONFIG=${DOCKER_CONFIG:-docker-compose-prod.yml}
./bin/build_frontend.sh
cp ./frontend/dist/assets.json ./backend/
docker-compose -f $DOCKER_CONFIG build
rm ./backend/assets.json