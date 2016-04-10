#!/bin/bash

#start development server on :8000

docker-compose build
./bin/init_db.sh
docker-compose up
