#!/bin/bash

#builds production images

source bin/env.sh

./bin/build_frontend.sh
cp ./frontend/dist/assets.json ./backend/
dcprod build
rm ./backend/assets.json