#!/bin/bash
# stops production server, rebuilds images, builds frontend, runs migrations, starts production server on :80

export DOCKER_CONFIG=${DOCKER_CONFIG:-docker-compose-prod.yml}
./bin/build_production.sh
./bin/init_db.sh
./bin/stop_production.sh
./bin/start_production.sh