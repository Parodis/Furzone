from django.shortcuts import render, redirect, HttpResponse
from .forms import NewsletterForm
from .models import Newsletter


def send(request):
    if request.method == 'POST':
        letter_form = NewsletterForm(request.POST)
        if letter_form.is_valid():
            email = letter_form.cleaned_data['email']
            if email is not None:
                if Newsletter.objects.filter(email=email).exists():
                    return HttpResponse(content='{"status": "false", "message": "Email is duplicate"}', status=400)
                letter_form.save()
                return HttpResponse(content='{"status": "true", "message": "Successfully added"}', status=200)
        else:
            letter_form = NewsletterForm()
    else:
        return redirect("/", status=301)
