from django.shortcuts import render, HttpResponse
from .models import Item
from category.models import Category
from django.core.exceptions import ObjectDoesNotExist
from amazon.api import AmazonAPI
import random
from django.template.defaultfilters import slugify
import requests
import shutil
import os
from django.db import IntegrityError


def get_item(request, **kwargs):
    context = {}
    try:
        item = Item.objects.get(slug=kwargs['product_slug'])
        category = Category.objects.get(slug=kwargs['slug'])
        context['item'] = item
        context['category'] = category
        return render(request, "item/item.html", context)
    except ObjectDoesNotExist:
        return HttpResponse('Not found', status=404)


def download_file(url):
    local_filename = url.split('/')[-1]
    r = requests.get(url, stream=True)
    with open(os.path.join('dist/img/item/', local_filename), 'wb') as f:
        shutil.copyfileobj(r.raw, f)
    return local_filename


def fetch_items_from_amazon(request):
    category_id = 3
    amazon = AmazonAPI('AKIAJWTF2DL2JCDJHFFQ', '2Pv0/KbNj5OwG6otEyg52zB9ZY3O+oWJWpzc8d+2', 'nekaravaev-20')
    products = amazon.search_n(30, Keywords="Shoes", SearchIndex='FashionBoys')
    list = [{'id': 3, 'keywords': 'Shoes', 'SearchIndex': 'FashionBoys'}]
    count = 0
    for i, product in enumerate(products):
        try:
            item = Item()
            item.name = product.title if product.title is not None else ''
            item.color = product.color if product.color is not None else ''
            item.description = product.editorial_review if product.editorial_review is not None else ''
            item.quantity = random.randint(1, 20)
            if product.large_image_url is not None:
                item.image = download_file(product.large_image_url)
            item.amazon_id = product.asin
            formatted_price = product.formatted_price
            price = int(float(formatted_price[1:]))
            item.price = price
            item.category_id_id = category_id
            item.slug = slugify(product.title)
            item.save()
            count += i
        except IntegrityError:
            continue

    return HttpResponse(count)
    # products = amazon.search_n(1, Keywords='kindle', SearchIndex='All')
    # product = amazon.lookup(ItemId='B01LXU4VO7')

# Create your views here.
