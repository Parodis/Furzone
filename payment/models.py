from django.db import models


class Payment(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    name = models.CharField(max_length=50)
# Create your models here.
