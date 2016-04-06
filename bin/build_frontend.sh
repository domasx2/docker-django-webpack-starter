#!/bin/bash

docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml run --rm frontend npm run-script build
docker-compose -f docker-compose.yml run --rm django ./bin/collectstatic.sh