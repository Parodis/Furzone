from django.db import models
from user.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

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


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100, blank=True, null=True)
    second_name = models.CharField(max_length=100, blank=True, null=True)
    city = models.CharField(max_length=100, blank=True, null=True)
    first_line_adress = models.CharField(max_length=255, blank=True, null=True)
    second_line_adress = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(choices=COUNTRIES, max_length=100, blank=True, null=True)
    postal_code = models.CharField(max_length=10, blank=True, null=True)
    personal_sale = models.IntegerField(default=0, blank=True, null=True)
    sex = models.CharField(choices=(("M", "Male"), ("F", "Female")), max_length=10, blank=True, null=True)
    forgot_key = models.CharField(max_length=255, blank=True, null=True)
    company_name = models.CharField(max_length=255, blank=True, null=True)
    email = models.EmailField(null=True, blank=True)
    # type = models.IntegerField(default=0)


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()