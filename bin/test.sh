#!/bin/bash
source bin/env.sh

if ! [[ $* == *--skipbuild* ]]; then
    ./bin/build_frontend.sh
else
    echo "skipping frontend build..."
fi

dctest run --rm  django ./bin/test.sh "$@"