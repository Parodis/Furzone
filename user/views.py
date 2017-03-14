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
                login_form = LoginForm()
                return HttpResponse(login_form.errors['__all__'])

            return render(request, 'login/success.html', {'login_form': login_form})


class RegistrationForm(forms.ModelForm):
    password2 = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ['email', 'password']
        widgets = {
            'password': forms.PasswordInput,
        }

    def clean_password2(self):
        cd = self.cleaned_data
        if cd['password'] != cd['password2']:
            raise forms.ValidationError("Password don't match")
        return cd['password']


def register(request):
    if request.method == "POST":
        register_form = RegistrationForm(request.POST)
        if register_form.is_valid():
            new_user = register_form.save(commit=False)
            new_user.set_password(register_form.cleaned_data['password'])
            new_user.save()
            return HttpResponseRedirect('/')
        else:
            register_form = RegistrationForm()
        return render(request, 'login/success.html', {'register_form': register_form})
