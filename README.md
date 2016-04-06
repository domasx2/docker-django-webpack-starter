# docker-django-webpack-starter

This is a starter project for a django app with webpack built frontend that uses docker for dev enironment.  
It's assembled to be fast, use latest & best practices, and be simple to understand & work with.  
Docker and docker-compose is all you need to develop, build & deploy!

## stack
python 3.5  
node 5.7  
Postgres DB  
Django  
Webpack  
Stylus  


## install
Just get latest docker & docker-compose:  
https://www.docker.com/  
https://docs.docker.com/compose/


## run
fork/download this repo and run
```sh
./bin/develop.sh
```
It will setup docker containers, download frontend & backend deps, start django dev server and webpack dev server.  
Once everything is finished, open [http://localhost:8000](http://localhost:8000)

## layout

```
bin/                          - various utility scripts

frontend/                     - frontend stuff
frontend/package.json         - npm package file with frotnend dependencies
frontend/src/js/              - javascript code
frontend/src/js/index.js      - js entry point. include other js deps here
frontend/src/style/           - stylesheets       
frontend/src/style/index.styl - stylesheet entry point. include other styl files here

backend/                      - backend stuff
backend/apps/                 - django apps
backend/conf/                 - django settings files
backend/conf/settings.py      - default config
backend/conf/settings_prod.py - production config
backend/templates/            - django global templates
backend/requirements.txt      - python dependencies
backend/gunicorn.conf.py      - gunicorn conf for production

logs/                         - in prod mode logs go here
nginx/                        - nginx stuff for prod mdoe
nginx/ssl/                    - put key & cert here if you use ssl
nginx/nginx_nossl.conf        - nginx conf if no ssl is used
nginx/nginx_ssl.conf          - nginx conf for deploy with ssl
```

## utility commands
`./bin` directory contains shell scripts to perform common tasks like start dev server, install dependencies and so on.

`./bin/develop.sh` - build docker containers, setup db, download deps & start dev servers. Run this and start working on your app.

`./bin/npm.sh [args]` - run npm commands. Eg, `./bin/npm.sh install somepackage --save-dev`

`./bin/django.sh [args]` - run django management commands. Eg, `./bin/django.sh makemigrations myapp`

`./bin/pipinstall.sh [package-name]` - install python3 package and save it to requirements.txt. `./bin/pipinstall.sh djangorestframework`

`./bin/build_frontend.sh`  - build frontend for prod to frontend/dist. 

`./bin/build_production.sh` - build production containers  

`./bin/deploy.sh` - rebuild production images, start

## run production mode

`./bin/deploy.sh` will build & (re)start dockerzied app in production mode using gunicorn app server & nginx to proxypass & serve static files.

## installing dependencies

### frontend
NPM is used for managing frontend/js dependencies. To install a package, run:  
```sh
./bin/npm.sh install [package] --save-dev
```
and run `./bin/develop.sh` again.

### backend
PIP is used for python deps. To install a package, run:  
```sh
./bin/pipinstlal.sh [package]
```
Which will install new python dep and add an entry to requirements.txt.

## tests

TODO
