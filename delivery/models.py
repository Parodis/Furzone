from django.db import models


class Delivery(models.Model):
    name = models.CharField(max_length=100)
    price = models.IntegerField()
# Create your models here.
