from django.db import models


class Contact(models.Model):
    topis = models.CharField(
        choices=(("Product", "Question about product"), ("Shipment", "Problem with order shipment"),
                 ("Advet", "Advertisement"), ("Other", "Other questions")), max_length=100,
        verbose_name='Topics')
    name = models.CharField(max_length=100, verbose_name='Name')
    email = models.EmailField(verbose_name='Email')
    message = models.TextField(verbose_name='Message')

    def __str__(self):
        return self.name

# Create your models here.
