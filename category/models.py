from django.db import models


class Category(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    name = models.CharField(max_length=50)
# Create your models here.