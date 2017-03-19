from django.shortcuts import render, HttpResponse
from .models import Item
from category.models import Category
from django.core.exceptions import ObjectDoesNotExist
from amazon.api import AmazonAPI
import random
from django.template.defaultfilters import slugify
import requests
import shutil, os


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
    category_id = 4
    amazon = AmazonAPI('AKIAJWTF2DL2JCDJHFFQ', '2Pv0/KbNj5OwG6otEyg52zB9ZY3O+oWJWpzc8d+2', 'nekaravaev-20')
    products = amazon.search_n(30, Keywords="Shoes", SearchIndex='FashionBoys')
    list = [{'id': category_id, 'keywords': '', 'SearchIndex': ''}]
    count = 0
    for i, product in enumerate(products):
        item = Item()
        if product.title is not None:
            item.name = product.title
        else:
            item.name = ""

        if product.editorial_review is not None:
            item.description = product.editorial_review
        else:
            item.description = ""
        item.quantity = random.randint(1, 20)
        item.image = download_file(product.large_image_url)
        if product.asin is not None:
            item.amazon_id = product.asin
        else:
            item.amazon_id = ""
        formatted_price = product.formatted_price
        price = int(float(formatted_price[1:]))
        item.price = price
        item.category_id_id = category_id
        item.slug = slugify(product.title)
        item.save()
        count += i

    return HttpResponse()
    # products = amazon.search_n(1, Keywords='kindle', SearchIndex='All')
    # product = amazon.lookup(ItemId='B01LXU4VO7')

# Create your views here.
