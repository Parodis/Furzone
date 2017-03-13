from django.template.defaulttags import register
from item.models import Item
from category.models import Category
from django.shortcuts import render, HttpResponse
from django.core.exceptions import ObjectDoesNotExist
from django.core.urlresolvers import reverse


@register.filter
def get_url(id):
    try:
        product = Item.objects.get(id=id)
        category = Category.objects.get(id=product.id)
        return reverse("product", kwargs={'slug': category.slug, 'product_slug': product.slug})
    except ObjectDoesNotExist:
        return HttpResponse('Not found', status=404)

# register.filter('get_item', get_item)
