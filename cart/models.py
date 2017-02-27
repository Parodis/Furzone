from django.db import models
from item.models import Item


class CartOrder(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    item_id = models.ForeignKey(Item)
    # order_id = models.ForeignKey(UserOrder.id)
    quantity = models.IntegerField()
# Create your models here.
