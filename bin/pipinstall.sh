#!/bin/bash

#install new pytho ndep via pip, add it to requirements.txt

docker-compose run --rm django ./bin/install_package.sh $@