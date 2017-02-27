from django.db import models


class User(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    first_name = models.CharField(max_length=100)
    second_name = models.CharField(max_length=100)
    birthday = models.DateField()
    city = models.CharField(max_length=100)
    first_line_adress = models.CharField(max_length=255)
    second_line_adress = models.CharField(max_length=255)
    country = models.CharField(max_length=100)
    postal_code = models.CharField(max_length=10)
    personal_sale = models.IntegerField(default=0)
    email = models.EmailField()
    password = models.CharField(max_length=255)
    sex = models.CharField(choices=(("M", "Male"), ("F", "Female")), max_length=10)
    forgot_key = models.CharField(max_length=255)

# Create your models here.
