from django.shortcuts import render
from .models import UserOrder
from profiles.models import Profile
from user.models import User


def order(request):
    return render(request, 'cart/order.html')
# Create your views here.
