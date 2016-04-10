#!/bin/bash

#initialize database if it hasn't been initialized yet

DOCKER_CONFIG_OVERRIDES=${DOCKER_CONFIG_OVERRIDES:-docker-compose.override.yml}
DB_CONTAINER=db
DBDATA_CONTAINER=dbdata

if  [ $(docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_OVERRIDES ps | grep $DBDATA_CONTAINER | wc -l) == 0 ]; then
    echo "initializing $DB_CONTAINER"
    docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_OVERRIDES up -d $DB_CONTAINER 
    DB_CONTAINER_ID=$(docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_OVERRIDES ps -q $DB_CONTAINER)
    for i in {30..0}; do
        echo "waiting for postgres to finish initializing..."
        if [ $(docker logs $DB_CONTAINER_ID 2>&1 | grep "database system is ready to accept connections" | wc -l) == 1 ]; then
            docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_OVERRIDES stop $DB_CONTAINER
            echo "db initialized"
            exit 0
        else
            sleep 1
        fi
    done
    if [ "$i" = 0 ]; then
        echo >&2 "db init failed"
        exit 1
    fi
fi
