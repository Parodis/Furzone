from django.shortcuts import render, redirect
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
            letter_form.save()
            return render(request, "base.html")
        else:
            letter_form = NewsletterForm()
        return render(request, 'base.html', {'letter_form': letter_form})
