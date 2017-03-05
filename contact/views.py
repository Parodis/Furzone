from django.shortcuts import render
from .models import Contact
from .forms import ContactCreateForm


def ContactCreate(request):
    if request.method == 'POST':
        form = ContactCreateForm(request.POST)
        if form.is_valid():
            contact = form.save()
            return render(request, '../templates/contact/created.html')
    form = ContactCreateForm()
    return render(request, '../templates/contact/contact.html')

# Create your views here.
