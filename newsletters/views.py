from django.shortcuts import render, redirect, HttpResponse
from django import forms
from .models import Newsletter
from django.views.decorators.csrf import csrf_protect


class NewsletterForm(forms.ModelForm):
    class Meta:
        model = Newsletter
        exclude = ('id',)


def send(request):
    if request.method == 'POST':
        letter_form = NewsletterForm(request.POST)
        if letter_form.is_valid():
            email = letter_form.cleaned_data['email']
            if email is not None:
                exseption = {'status': 'false', 'message': 'Email is duplicate', 'code': '400'}
                return HttpResponse(exseption, status=400)
            letter_form.save()
            return render(request, "base.html", status=200)
        else:
            letter_form = NewsletterForm()
        return render(request, 'base.html', {'letter_form': letter_form})
