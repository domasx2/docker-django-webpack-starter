#!/bin/bash
# create a db backups to backups/

DOCKER_CONFIG_PROD=${DOCKER_CONFIG_PROD:-docker-compose.production.yml}
DB_USER=${DB_USER:-django}
DB_NAME=${DB_NAME:-django}
BACKUP_FILE=django$1_$(date +'%Y_%m_%dT%H_%M_%S').bak
docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_PROD -f docker-compose.db.yml run --rm dbclient pg_dump -Fc -h db -U $DB_USER -d $DB_NAME -f /backups/$BACKUP_FILE
echo "backup $BACKUP_FILE created"