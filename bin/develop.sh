#!/bin/bash

#start development server on :8000

source bin/env.sh

dcdev build
./bin/init_db.sh
dcdev up
