from django.db import models


class User(models.Model):
    first_name = models.CharField(max_length=100, blank=True)
    second_name = models.CharField(max_length=100, blank=True)
    birthday = models.DateField(blank=True)
    city = models.CharField(max_length=100, blank=True)
    first_line_adress = models.CharField(max_length=255, blank=True)
    second_line_adress = models.CharField(max_length=255, blank=True)
    country = models.CharField(max_length=100, blank=True)
    postal_code = models.CharField(max_length=10, blank=True)
    personal_sale = models.IntegerField(default=0, blank=True)
    email = models.EmailField()
    password = models.CharField(max_length=255)
    sex = models.CharField(choices=(("M", "Male"), ("F", "Female")), max_length=10, blank=True)
    forgot_key = models.CharField(max_length=255, blank=True, null=True)

# Create your models here.
