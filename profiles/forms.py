from django import forms
from .models import *
from user.models import User


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


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email']


class ProfileForm(forms.ModelForm):
    # users = User.objects.all().select_related('Profile')

    class Meta:
        model = Profile
        fields = ['first_name', 'second_name', 'company_name', 'first_line_adress',
                  'city', 'postal_code', 'country', 'sex', 'email'
                  ]
        widgets = {
            'country': forms.Select(choices=COUNTRIES),
            'sex': forms.Select(choices=(("M", "Male"), ("F", "Female")))
        }
