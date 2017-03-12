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
                if Newsletter.objects.filter(email=email).exists():
                    return HttpResponse(content='{"status": "False", "message": "Email is duplicate"}', status=400)
                letter_form.save()
                return HttpResponse(content='{"status": "True", "message": "Successfully added"}', status=200)
        else:
            letter_form = NewsletterForm()
        return render(request, 'base.html', {'letter_form': letter_form})
