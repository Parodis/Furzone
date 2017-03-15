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


class RegisterForm(forms.ModelForm):
    error_messages = {
        'password_mismatch': ("The two password fields didn't match."),
    }
    password1 = forms.CharField(widget=forms.PasswordInput)
    password2 = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ('email',)

    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError(
                self.error_messages['password_mismatch'],
                code='password_mismatch',
            )
        return password2

    def save(self, commit=True):
        user = super(RegisterForm, self).save(commit=False)
        user.set_password(self.cleaned_data['password1'])
        if commit:
            user.save()
        return user

