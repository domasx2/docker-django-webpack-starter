#!/bin/bash
# stops production server, rebuilds images, builds frontend, runs migrations, starts production server on :80

export DOCKER_CONFIG=${DOCKER_CONFIG:-docker-compose-prod.yml}
./bin/stop_production.sh
./bin/init_db.sh
./bin/build_frontend.sh
./bin/start_production.sh