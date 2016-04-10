#!/bin/bash

#builds production images, 
#initializes database or creates db backup if it was initialized already
#(re)starts prodcution containers

#for init_db.sh
export DOCKER_CONFIG_OVERRIDES=${DOCKER_CONFIG_OVERRIDES:-docker-compose.production.yml}

#for start/stop prdocution
export DOCKER_CONFIG_PROD=${DOCKER_CONFIG_PROD:-docker-compose.production.yml}

#which djang conf to use for build prod frontend
export DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE:-conf.settings_prod}

./bin/build_production.sh
if  [ $(docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_OVERRIDES ps | grep dbdata | wc -l) == 0 ]; then
    ./bin/init_db.sh 
else
    ./bin/backup.sh
fi
./bin/stop_production.sh
./bin/start_production.sh