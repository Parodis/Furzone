from django.db import models
from item.models import Item


class CartOrder(models.Model):
    item_id = models.ForeignKey(Item)
    # order_id = models.ForeignKey(UserOrder.id)
    quantity = models.IntegerField()
# Create your models here.
