#!/bin/bash

docker-compose -f docker-compose.yml build
./bin/npm.sh run-script cleandist
./bin/npm.sh run-script build
docker-compose -f docker-compose.yml run --rm django bash -c "./install.sh; python3 manage.py collectstatic --noinput"