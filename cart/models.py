from django.db import models
from item.models import Item
from order.models import UserOrder


class CartOrder(models.Model):
    item_id = models.ForeignKey(Item)
    order_id = models.IntegerField(blank=True, null=True)
    quantity = models.IntegerField()

    def __str__(self):
        return 'Order id: {}'.format(self.order_id)
# Create your models here.
