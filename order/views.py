from django.shortcuts import render
from .models import UserOrder
from django.contrib.auth.models import User
from cart.models import CartOrder
from delivery.models import Delivery
from payment.models import Payment
from carton.cart import Cart
from item.models import Item


def order(request):
    if request.method == 'POST':
        context = {}
        cart = Cart(request.session)

        summary = cart.total
        delivery = request.POST.get('delivery')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        first_line_adress = request.POST.get('first_line_adress')
        city = request.POST.get('city')
        postal_code = request.POST.get('postal_code')
        country = request.POST.get('country')
        email = request.POST.get('email')
        paymentMethod = request.POST.get('paymentMethod')

        if request.user.is_authenticated():
            user = User.objects.get(id=request.user.id)
            user.first_name = first_name
            user.last_name = last_name
            user.email = email
            user.save()

        order = UserOrder.objects.create(status='Pending', delivery_id_id=delivery,
                                         payment_id_id=paymentMethod, first_name=first_name, email=email, user_id_id=request.user.id,
                                         city=city, country=country, first_line_adress=first_line_adress,
                                         postal_code=postal_code, summary=summary)

        for item in cart.items:
            product = Item.objects.get(id=item.product.id)
            product.quantity -= item.quantity
            product.save()
            CartOrder.objects.create(order_id=order.id, item_id_id=item.product.id, quantity=item.quantity)

        cart.clear()

        return render(request, "cart/thanks.html", context)
    else:
        context = {}
        context['delivery'] = Delivery.objects.all()
        context['payment'] = Payment.objects.all()
        return render(request, 'cart/order.html', context)
# Create your views here.
