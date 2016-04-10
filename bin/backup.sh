#!/bin/bash
# create a db backups to backups/

source bin/env.sh

BACKUP_FILE=django$1_$(date +'%Y_%m_%dT%H_%M_%S').bak
docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_PROD -f docker-compose.db.yml run --rm dbclient pg_dump -Fc -h db -U $DB_USER -d $DB_NAME -f /backups/$BACKUP_FILE
echo "backup $BACKUP_FILE created"