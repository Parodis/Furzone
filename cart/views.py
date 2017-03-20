from django.shortcuts import render, HttpResponse
from django.views.generic import TemplateView
from carton.cart import Cart
from item.models import Item


def add(request):
    cart = Cart(request.session)
    item = Item.objects.get(id=request.POST.get('id'))
    cart.add(item, price=item.price)
    return HttpResponse('Added')


def remove(request):
    cart = Cart(request.session)
    product = Item.objects.get(id=request.GET.get('id'))
    cart.remove(product)
    return HttpResponse("Removed")


def show(request):
    return render(request, 'cart/cart.html')
# Create your views here.
