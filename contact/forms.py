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
            'message': (forms.Textarea(attrs={'class': 'message'}))
        }
