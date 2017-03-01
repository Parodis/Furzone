from django.db import models
from category.models import Category


class Item(models.Model):
    name = models.CharField(max_length=50)
    description = models.TextField()
    # color = models.CharField(max_length=255)
    size = models.CharField(choices=(('34', '34'), ('36', '36'), ('38', '38')), max_length=20)
    options = models.TextField()
    quantity = models.IntegerField()
    image = models.ImageField(null=True)
    price = models.IntegerField()
    category_id = models.ForeignKey(Category)
# Create your models here.
