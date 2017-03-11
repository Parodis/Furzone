from django.shortcuts import render, HttpResponseRedirect
from django import forms
from django.contrib.auth import authenticate, login
from .models import User


class LoginForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['email', 'password']
        widgets = {
            'password': forms.PasswordInput,
        }

    def clean(self):
        cleaned_data = super(LoginForm, self).clean()
        if not self.errors:
            user = authenticate(email=cleaned_data['email'], password=cleaned_data['password'])
            if user is None:
                raise forms.ValidationError('Email or password incorrect')
            self.user = user
        return cleaned_data

    def get_user(self):
        return self.user or None


def login_in(request):
    if request.method == "POST":
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            if login_form.get_user():
                login(request, login_form.get_user())
                return HttpResponseRedirect('/')
        else:
            form = LoginForm()
        return render(request, 'base.html', {'form': login_form})
