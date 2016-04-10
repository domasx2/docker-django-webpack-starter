#!/bin/bash

#run django management command in development mode

docker-compose run --rm django python3 manage.py $@