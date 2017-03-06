from django.shortcuts import render
from .models import Contact
from django import forms


class ContactForm(forms.ModelForm):
    class Meta:
        model = Contact
        fields = ('topis', 'name', 'email', 'message')
        widgets = {
            'topis': (
            forms.Select(choices=(("Product", "Question about product"), ("Shipment", "Problem with order shipment"),
                                  ("Advet", "Advertisement"), ("Other", "Other questions")))),
            'message': (forms.TextInput(attrs={'class': 'message'}))
        }


def ContactCreate(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, "../templates/contact/created.html")
    else:
        form = ContactForm()
    return render(request, '../templates/contact/contact.html', {'form': form})

# Create your views here.
