#!/bin/bash

#install new pytho ndep via pip, add it to requirements.txt
source bin/env.sh

dcdev run --rm django ./bin/install_package.sh $@