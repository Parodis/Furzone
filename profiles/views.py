from django.shortcuts import render, HttpResponseRedirect
from django.views.generic import TemplateView
from django import forms
from .models import *
from user.models import User
from django.contrib.auth.decorators import login_required
from django.core.exceptions import PermissionDenied
from django.db import transaction


class Account(TemplateView):
    template_name = 'account/account.html'


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


@login_required
@transaction.atomic
def edit_account(request):
    user = User.objects.select_related('profile').get(instance=request.user.id)
    user_form = UserForm(instance=request.user)
    profile_form = ProfileForm(instance=request.user.profile)
    if request.user.is_authenticated():

        if request.method == 'POST':
            user_form = UserForm(instance=request.user)
            profile_form = ProfileForm(instance=request.user.profile)
            if user_form.is_valid() and profile_form.is_valid():
                user_form.save()
                profile_form.save()
                return HttpResponseRedirect('/account/')
            else:
                user_form = UserForm(instance=request.user)
                profile_form = ProfileForm(instance=request.user.profile)
        return render(request, "account/edit.html", {'user_form': user_form, 'profile_form': profile_form})
    else:
        raise PermissionDenied

# Create your views here.
