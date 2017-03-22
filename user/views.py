from django.shortcuts import render, HttpResponseRedirect, HttpResponse
from django.contrib.auth import authenticate, login, logout
from .forms import *


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


def register(request):
    if request.method == "POST":
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user = User(username=register_form.cleaned_data['username'])
            user.set_password(register_form.cleaned_data['password'])
            user.save()
            auth = authenticate(username=register_form.cleaned_data['username'],
                                password=register_form.cleaned_data['password'])
            if auth is not None:
                login(request, auth)
            return HttpResponse(content='{"status": "True", "message": "Success"}', status=200)
        else:
            register_form = RegisterForm()
        return render(request, 'login/register.html', {'register_form': register_form})


def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/')