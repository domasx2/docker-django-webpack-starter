#!/bin/bash

#compile frontend production build to frontend/dist

source bin/env.sh

dcdev build
dcdev run --rm frontend npm run-script build
dcdev run --rm -e DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_PROD django ./bin/collectstatic.sh