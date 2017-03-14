from django.db import models


class Payment(models.Model):
    name = models.CharField(max_length=50)
# Create your models here.
