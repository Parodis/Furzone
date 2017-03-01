from django.db import models
from user.models import User
from cart.models import CartOrder
from delivery.models import Delivery
from payment.models import Payment


class UserOrder(models.Model):
    cart_id = models.ForeignKey(CartOrder)
    user_id = models.ForeignKey(User)
    status = models.IntegerField()
    delivery_id = models.ForeignKey(Delivery)
    summary = models.IntegerField()
    payment_id = models.ForeignKey(Payment)
# Create your models here.
