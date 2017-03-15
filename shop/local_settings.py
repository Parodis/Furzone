import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

ALLOWED_HOSTS = []

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'shopbase',
        'HOST': 'localhost',
        'PORT': '5432',
        'USER': 'admin',
        'PASSWORD': 'admin',
    }
}
