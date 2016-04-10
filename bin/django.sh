#!/bin/bash

#run django management command in development mode
source bin/env.sh

dcdev run --rm django python3 manage.py $@