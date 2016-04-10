from .settings import *


ALLOWED_HOSTS = ['*']

DEBUG = False
TEMPLATE_DEBUG = False
WEBPACK_DEV_SERVER = False

STATIC_ASSETS_JSON = os.path.join(BASE_DIR, 'assets.json')

SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'applogfile': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/tmp/logs/app/app.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['applogfile'],
            'level': os.getenv('DJANGO_LOG_LEVEL', 'INFO'),
        },
    },
}