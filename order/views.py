from django.shortcuts import render
from .models import UserOrder
from profiles.models import Profile
from user.models import User
from django import forms
from delivery.models import Delivery
from payment.models import Payment


def order(request):
    return render(request, 'cart/order.html')
# Create your views here.
