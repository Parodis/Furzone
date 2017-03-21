from django import forms
from .models import User


class LoginForm(forms.Form):
    username = forms.CharField(max_length=20)
    password = forms.CharField(widget=forms.PasswordInput())

    def get_user(self):
        return self.user or None



class RegisterForm(forms.ModelForm):

    class Meta:
        model = User
        fields = ('username', 'password')

    # def clean_password2(self):
    #     password1 = self.cleaned_data.get("password")
    #     password2 = self.cleaned_data.get("passwordRepeat")
    #     if password1 and password2 and password1 != password2:
    #         raise forms.ValidationError(
    #             self.error_messages['password_mismatch'],
    #             code='password_mismatch',
    #         )
    #     return password2

    # def save(self, commit=True):
    #     user = super(RegisterForm, self).save(commit=False)
    #     user.set_password(self.cleaned_data['password1'])
    #     if commit:
    #         user.save()
    #     return user