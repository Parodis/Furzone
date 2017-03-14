# from django.template.defaulttags import register
from item.models import Item
from category.models import Category
from django.shortcuts import render, HttpResponse
from django.core.exceptions import ObjectDoesNotExist
from django.core.urlresolvers import reverse
from django import template

register = template.Library()


@register.simple_tag(takes_context=True)
def get_url(context):
    try:
        product = Item.objects.get(id=id)
        category = Category.objects.get(id=product.id)
        revers = reverse("product", kwargs={'slug': category.slug, 'product_slug': product.slug})
        return revers
    except ObjectDoesNotExist:
        return HttpResponse('Not found', status=404)

register.filter('get_url', get_url)
