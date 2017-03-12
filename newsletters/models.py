from django.db import models


class Newsletter(models.Model):
    email = models.EmailField(unique=True)
# Create your models here.
