#!/bin/bash

#compile frontend production build to frontend/dist

export DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE:-conf.settings_prod}

docker-compose build
docker-compose run --rm frontend npm run-script build
docker-compose run --rm -e DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE django ./bin/collectstatic.sh