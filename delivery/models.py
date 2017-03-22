from django.db import models


class Delivery(models.Model):
    name = models.CharField(choices=(('DHL', 'DHL International'), ('FX', 'FedEx')), max_length=100)
    price = models.IntegerField()
# Create your models here.
