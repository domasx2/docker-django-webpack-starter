#!/bin/bash

#install django dependencies
mkdir -p pipcache
pip3 install --cache-dir=/app/pipcache -r requirements.txt