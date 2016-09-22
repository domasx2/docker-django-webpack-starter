export DOCKER_CONFIG_PROD=${DOCKER_CONFIG_PROD:-docker-compose.production.yml}
export DOCKER_CONFIG_DEV=${DOCKER_CONFIG_DEV:-docker-compose.override.yml}
export DOCKER_CONFIG_TEST=${DOCKER_CONFIG_TEST:-docker-compose.test.yml}

export DB_USER=${DB_USER:-django}
export DB_NAME=${DB_NAME:-django}

export DJANGO_SETTINGS_DEV=${DJANGO_SETTINGS_DEV:-conf.settings}
export DJANGO_SETTINGS_PROD=${DJANGO_SETTINGS_MODULE:-conf.settings_prod}
export DJANGO_SETTINGS_TEST=${DJANGO_SETTINGS_TEST:-conf.settings_test}

dcdev() {
    docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_DEV "$@"
}

dcprod() {
    docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_PROD "$@"
}

dctest() {
    docker-compose -f docker-compose.yml -f $DOCKER_CONFIG_TEST "$@"
}