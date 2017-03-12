from django.shortcuts import render
from .models import Item
from django.views.generic import DetailView


class ItemDetailView(DetailView):
    model = Item
    template_name = "item/item.html"

    def get_context_data(self, **kwargs):
        context = {}
        item = Item.objects.get(slug=self.kwargs['product_slug'])
        context['item'] = item
        return context


def get_item(request, product_slug):
    context = {}
    item = Item.objects.get(slug=product_slug)
    context['item'] = item
    return render(request, "item/item.html", context)

# Create your views here.
