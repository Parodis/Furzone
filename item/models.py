from django.db import models
from category.models import Category

class Item(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    name = models.CharField(max_length=50)
    description = models.TextField()
    # color = models.CharField(max_length=255)
    size = models.CharField(choices=(('34', '34'), ('36', '36'), ('38', '38')), max_length=20)
    options = models.TextField()
    quantity = models.IntegerField()
    image = models.ImageField()
    price = models.IntegerField()
    category_id = models.ForeignKey(Category)
# Create your models here.
