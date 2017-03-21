from django.shortcuts import render, HttpResponse
from django.views.generic import TemplateView
from carton.cart import Cart
from item.models import Item
import json


def add(request):
    cart = Cart(request.session)
    item = Item.objects.get(id=request.POST.get('id'))
    cart.add(item, price=item.price)
    response = {
        'status': 'true',
        'message': 'OK',
        'count': cart.count
    }
    return HttpResponse(json.dumps(response), content_type='application/javascript; charset=utf8', status=200)


def remove(request):
    cart = Cart(request.session)
    product = Item.objects.get(id=request.GET.get('id'))
    cart.remove(product)
    response = {
        'status': 'true',
        'message': 'Removed',
        'count': cart.count
    }
    return HttpResponse(json.dumps(response), content_type='application/javascript; charset=utf8', status=200)


def show(request):
    return render(request, 'cart/cart.html')
# Create your views here.
