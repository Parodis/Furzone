from django.db import models


class Delivery(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    name = models.CharField(max_length=100)
    price = models.IntegerField()
# Create your models here.
