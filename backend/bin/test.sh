#!/bin/bash
./bin/install.sh
python3 manage.py test --liveserver=localhost:8082 "$@"