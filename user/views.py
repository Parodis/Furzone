from django.shortcuts import render, HttpResponseRedirect, HttpResponse
from django import forms
from django.contrib.auth import authenticate, login
from .models import User


class LoginForm(forms.Form):
    username = forms.CharField(max_length=20)
    password = forms.CharField(widget=forms.PasswordInput())

    def get_user(self):
        return self.user or None


def login_in(request):
        if request.method == "POST":
            login_form = LoginForm(request.POST)
            if login_form.is_valid():
                user = authenticate(username=login_form.cleaned_data['username'], password=login_form.cleaned_data['password'])
                if user is not None:
                    login(request, user)
                    return HttpResponse(content='{"status": "True", "message": "Success"}', status=200)
            else:
                print(login_form.errors)
                login_form = LoginForm()
                return HttpResponse(content='login_form.errors')

            return render(request, 'login/success.html', {'login_form': login_form})


class RegisterForm(forms.ModelForm):
    error_messages = {
        'password_mismatch': ("The two password fields didn't match."),
    }
    password1 = forms.CharField(widget=forms.PasswordInput)
    password2 = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ('username',)

    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError(
                self.error_messages['password_mismatch'],
                code='password_mismatch',
            )
        return password2

    # def save(self, commit=True):
    #     user = super(RegisterForm, self).save(commit=False)
    #     user.set_password(self.cleaned_data['password1'])
    #     if commit:
    #         user.save()
    #     return user


def register(request):
    if request.method == "POST":
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user = User.objects.create(username=register_form.cleaned_data['username'],
                                password=register_form.cleaned_data['password1'],
                                email=register_form.cleaned_data['email'])
            return HttpResponse(content='{"status": "True", "message": "Success"}', status=200)
        else:
            register_form = RegisterForm()
        return render(request, 'login/register.html', {'register_form': register_form})