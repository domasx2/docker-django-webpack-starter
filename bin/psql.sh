#!/bin/bash
# open psql session to production db

DOCKER_CONFIG_PROD=${DOCKER_CONFIG_PROD:-docker-compose.production.yml}
DB_USER=${DB_USER:-django}
DB_NAME=${DB_NAME:-django}
docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_PROD -f docker-compose.db.yml run --rm dbclient psql -h db -U $DB_USER $DB_NAME
