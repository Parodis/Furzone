from django.db import models
from django.core.exceptions import ValidationError


def validate_image(fieldfile_obj):
    filesize = fieldfile_obj.file.size
    megabyte_limit = 5.0
    if filesize > megabyte_limit * 1024 * 1024:
        raise ValidationError("Max file size is %sMB" % str(megabyte_limit))


class Category(models.Model):
    name = models.CharField(max_length=50)
    slug = models.SlugField(null=True)
    sort_order = models.CharField(max_length=50, null=True, blank=True)
    image = models.ImageField(null=True, blank=True, upload_to='category', validators=[validate_image],
                              help_text='Maximum file size allowed is 5Mb')
    parent_category = models.ForeignKey('self', null=True, blank=True)

    def __str__(self):
        return '{}, parent: {}'.format(self.name, self.parent_category)

# Create your models here.
