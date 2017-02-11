#!/bin/bash
./bin/install.sh
python3 manage.py test --noinput --liveserver=localhost:8082 "$@"