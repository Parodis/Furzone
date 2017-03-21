from django.shortcuts import render
from .forms import ContactForm


def ContactCreate(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, "contact/created.html")
    else:
        form = ContactForm()
    return render(request, 'contact/contact.html', {'form': form})

# Create your views here.
