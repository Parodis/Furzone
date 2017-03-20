from django.shortcuts import render, HttpResponseRedirect
from django.views.generic import TemplateView
from django import forms
from .models import *
from user.models import User
from django.contrib.auth.decorators import login_required
from django.core.exceptions import PermissionDenied


class Account(TemplateView):
    template_name = 'account/account.html'


class AccountForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['first_name', 'second_name', 'company_name', 'first_line_adress',
                  'city', 'postal_code', 'country', 'sex', 'email'
                  ]
        widgets = {
            'country': forms.Select(choices=COUNTRIES),
            'sex': forms.Select(choices=(("M", "Male"), ("F", "Female")))
        }


@login_required()
def edit_account(request, pk):
    user = User.objects.get(pk=pk)
    edit_form = AccountForm()
    if request.user.is_authenticated() and request.user.id == user.id:
        if request.method == 'POST':
            edit_form = AccountForm(request.POST, instance=user)
            if edit_form.is_valid():
                edit_form.save()
                return HttpResponseRedirect('/account/')
            else:
                edit_form = AccountForm()
        return render(request, "account/edit.html", {'edit_form': edit_form})
    else:
        raise PermissionDenied


# Create your views here.
