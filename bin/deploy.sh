#!/bin/bash

#builds production images, initializes database if necessary, (re)starts prodcution containres

#for init_db.sh
export DOCKER_CONFIG_OVERRIDES=${DOCKER_CONFIG_OVERRIDES:-docker-compose.production.yml}

#for start/stop prdocution
export DOCKER_CONFIG_PROD=${DOCKER_CONFIG_PROD:-docker-compose.production.yml}

export DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE:-conf.settings_prod}

./bin/build_production.sh
./bin/init_db.sh
./bin/stop_production.sh
./bin/start_production.sh