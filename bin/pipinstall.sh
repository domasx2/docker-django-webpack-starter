#!/bin/bash

export DOCKER_CONFIG=${DOCKER_CONFIG:-docker-compose.yml}
docker-compose -f $DOCKER_CONFIG run --rm django ./bin/install_package.sh $@