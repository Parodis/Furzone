from django.db import models


class Payment(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return '{}, id: {}'.format(self.name, self.id)
# Create your models here.
