#!/bin/bash
# restore a bacakup. arg is a filename that exitsts in backups dir

DOCKER_CONFIG_PROD=${DOCKER_CONFIG_PROD:-docker-compose.production.yml}
BACKUP_FILE=$1
DB_USER=${DB_USER:-django}
DB_NAME=${DB_NAME:-django}

if ! [ -f $BACKUP_FILE ]; then
    echo "file not found"
    exit 1
fi

if [ $(docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_PROD -f docker-compose.db.yml ps | grep "db" | grep "Up" | wc -l) != 0 ]; then
    echo "database container running. please stop before trying to restore"
    exit 1
fi

echo "dropping database..."
docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_PROD -f docker-compose.db.yml run --rm dbclient dropdb -h db -U $DB_USER $DB_NAME
echo "creating database..."
docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_PROD -f docker-compose.db.yml run --rm dbclient createdb -h db -U $DB_USER -O $DB_USER $DB_NAME
echo "restoring database..."
docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_PROD -f docker-compose.db.yml run --rm dbclient pg_restore -Fc -h db -U $DB_USER -d $DB_NAME $BACKUP_FILE
echo "restore complete"