from django.shortcuts import render, HttpResponseRedirect, HttpResponse
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
        login_form = LoginForm(request.POST or None)
        if request.method == "POST":
            if login_form.is_valid():
                if login_form.get_user():
                    login(request, login_form.get_user())
                    return HttpResponseRedirect('/')
            else:
                form = LoginForm()
                return HttpResponse(login_form.errors['__all__'])

            return render(request, 'login/success.html', {'form': login_form})
