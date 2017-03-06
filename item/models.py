from django.db import models
from category.models import Category
from django.core.exceptions import ValidationError


def validate_image(fieldfile_obj):
    filesize = fieldfile_obj.file.size
    megabyte_limit = 5.0
    if filesize > megabyte_limit * 1024 * 1024:
        raise ValidationError("Max file size is %sMB" % str(megabyte_limit))


class Item(models.Model):
    name = models.CharField(max_length=50)
    description = models.TextField()
    # color = models.CharField(max_length=255)
    size = models.CharField(choices=(('34', '34'), ('36', '36'), ('38', '38')), max_length=20)
    options = models.TextField()
    quantity = models.IntegerField()
    image = models.ImageField(null=True, blank=True, upload_to='dist/img', validators=[validate_image],
                              help_text='Maximum file size allowed is 5Mb')
    price = models.IntegerField()
    category_id = models.ForeignKey(Category)
# Create your models here.
