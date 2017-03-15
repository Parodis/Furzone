from django.db import models
from django.contrib.auth.models import User


class Profiles(models.Model):
    user = models.ForeignKey(User)
    first_name = models.CharField(max_length=100, blank=True, null=True)
    second_name = models.CharField(max_length=100, blank=True, null=True)
    city = models.CharField(max_length=100, blank=True, null=True)
    first_line_adress = models.CharField(max_length=255, blank=True, null=True)
    second_line_adress = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(max_length=100, blank=True, null=True)
    postal_code = models.CharField(max_length=10, blank=True, null=True)
    personal_sale = models.IntegerField(default=0, blank=True, null=True)
    sex = models.CharField(choices=(("M", "Male"), ("F", "Female")), max_length=10, blank=True, null=True)
    forgot_key = models.CharField(max_length=255, blank=True, null=True)
# Create your models here.
