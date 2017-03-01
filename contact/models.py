from django.db import models


class Contact(models.Model):
    topis = models.CharField(choices=(("Product", "Question about product"), ("Shipment", "Problem with order shipment"),
                                      ("Advet", "Advertisement"), ("Other", "Other questions")), max_length=100)
    name = models.CharField(max_length=100)
    email = models.EmailField()
    message = models.TextField()

# Create your models here.
