from django.db import models


class Newsletter(models.Model):
    email = models.EmailField()
# Create your models here.
