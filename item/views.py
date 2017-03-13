from django.shortcuts import render, HttpResponse
from .models import Item
from category.models import Category
from django.views.generic import DetailView
from django.core.exceptions import ObjectDoesNotExist


class ItemDetailView(DetailView):
    model = Item
    template_name = "item/item.html"

    def get_context_data(self, **kwargs):
        context = {}
        item = Item.objects.get(slug=self.kwargs['product_slug'])
        context['item'] = item
        return context


def get_item(request,  **kwargs):
    context = {}
    try:
        item = Item.objects.get(slug=kwargs['product_slug'])
        category = Category.objects.get(slug=kwargs['slug'])
        context['item'] = item
        context['category'] = category
        return render(request, "item/item.html", context)
    except ObjectDoesNotExist:
        return HttpResponse('Not found', status=404)
# Create your views here.
