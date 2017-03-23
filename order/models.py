from django.db import models
from user.models import User
from delivery.models import Delivery
from payment.models import Payment

COUNTRIES = (
    ('GB', 'United Kingdom'),
    ('AF', 'Afghanistan'),
    ('AL', 'Albania'),
    ('DZ', 'Algeria'),
    ('AS', 'American Samoa'),
    ('AD', 'Andorra'),
    ('AR', 'Argentina'),
    ('AM', 'Armenia'),
    ('AU', 'Australia'),
    ('AT', 'Austria'),
    ('BY', 'Belarus'),
    ('BE', 'Belgium'),
    ('BZ', 'Belize'),
    ('BM', 'Bermuda'),
    ('LT', 'Lithuania'),
    ('LU', 'Luxembourg'),
    ('RU', 'Russian Federation'),
    ('US', 'United States'),
)


class UserOrder(models.Model):
    cart_id = models.IntegerField(blank=True, null=True)
    user_id = models.ForeignKey(User, blank=True, null=True)
    status = models.CharField(blank=True, null=True, max_length=255)
    delivery_id = models.ForeignKey(Delivery)
    summary = models.IntegerField()
    email = models.CharField(blank=True, null=True, max_length=255)
    payment_id = models.ForeignKey(Payment)
    first_name = models.CharField(max_length=255, blank=True, null=True)
    city = models.CharField(max_length=100, blank=True, null=True)
    first_line_adress = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(choices=COUNTRIES, max_length=100, blank=True, null=True)
    postal_code = models.CharField(max_length=10, blank=True, null=True)

    def __str__(self):
        return 'Order $ {}, id: {}, status: {}'.format(self.summary, self.id, self.status)
# Create your models here.
