from django.db import models


class Payment(models.Model):
    name = models.CharField(choices=(('Credit', 'Credit Card'), ('Cash', 'Cash')), max_length=50)
# Create your models here.
