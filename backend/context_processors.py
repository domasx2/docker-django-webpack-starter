from django.conf import settings
import os.path
import json

static_assets = None

if not settings.WEBPACK_DEV_SERVER:
    assets_json_fname = os.path.join(settings.STATIC_ASSETS_JSON)
    try:
        with open(assets_json_fname, 'r') as f:
            static_assets = json.load(f)['main']
    except Exception:
        raise Exception('failed to read %s. was frontend built?' % assets_json_fname)


#use by base.html to figure out what statics to load
def static_resources(request):
    return {
        "WEBPACK_DEV_SERVER": settings.WEBPACK_DEV_SERVER,
        "static_assets": static_assets
    }