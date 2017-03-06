from django.shortcuts import render
from .models import Contact
from django import forms


# from .forms import ContactCreateForm

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
        # topis = forms.CharField(max_length=100, widget=forms.Select(
        #     choices=(("Product", "Question about product"), ("Shipment", "Problem with order shipment"),
        #              ("Advet", "Advertisement"), ("Other", "Other questions"))))
        # name = forms.CharField(max_length=100)
        # email = forms.EmailField()
        # message = forms.CharField()


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
