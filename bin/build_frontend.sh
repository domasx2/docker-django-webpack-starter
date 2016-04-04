#!/bin/bash

docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml run --rm frontend bash -c "./install.sh && npm run-script cleandist && npm run-script build && exit"
docker-compose -f docker-compose.yml run --rm django bash -c "./install.sh && python3 manage.py collectstatic --noinput"