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
import re
from django.db import IntegrityError


def get_item(request, **kwargs):
    context = {}
    try:
        item = Item.objects.get(slug=kwargs['product_slug'])
        category = Category.objects.get(slug=kwargs['child_slug'])
        context['item'] = item
        context['category'] = category
        return render(request, "item/item.html", context)
    except ObjectDoesNotExist:
        return HttpResponse('Not found', status=404)


def download_file(url):
    local_filename = re.sub('[^A-Za-z0-9.]+', '', url.split('/')[-1])
    r = requests.get(url, stream=True)
    with open(os.path.join('dist/img/item/', local_filename), 'wb') as f:
        shutil.copyfileobj(r.raw, f)
    return local_filename


def fetch_items_from_amazon(request):
    category_id = 3
    amazon = AmazonAPI('AKIAJWTF2DL2JCDJHFFQ', '2Pv0/KbNj5OwG6otEyg52zB9ZY3O+oWJWpzc8d+2', 'nekaravaev-20')
    terms_list = [
                  {'cat_id': 3, 'keywords': 'Shoes', 'Title': 'Adidas', 'SearchIndex': 'FashionMen', 'Sort': '-price'},
                  {'cat_id': 3, 'keywords': 'Shoes', 'Title': 'Nike', 'SearchIndex': 'FashionMen', 'Sort': 'relevancerank'},
                  {'cat_id': 3, 'keywords': 'Shoes', 'Title': 'Vans', 'SearchIndex': 'FashionMen', 'Sort': 'relevancerank'},
                  {'cat_id': 4, 'keywords': 'Polo',  'Title': 'Fred Perry', 'SearchIndex': 'FashionMen', 'Sort': 'relevancerank'},
                  {'cat_id': 4, 'keywords': 'Shirt', 'Title': 'Vans Shirt', 'SearchIndex': 'FashionMen', 'Sort': 'relevancerank'},
                  {'cat_id': 4, 'keywords': 'Shirt', 'Title': 'Supreme shirt', 'SearchIndex': 'FashionMen', 'Sort': 'relevancerank'},
                  {'cat_id': 5, 'keywords': 'Jacket', 'Title': 'The North Face', 'SearchIndex': 'FashionMen', 'Sort': 'relevancerank'},
                  {'cat_id': 5, 'keywords': 'Jacket', 'Title': 'Calvin Klein', 'SearchIndex': 'FashionMen', 'Sort': 'relevancerank'},
                  {'cat_id': 5, 'keywords': 'Jacket', 'Title': 'Tommy Hilfiger', 'SearchIndex': 'FashionMen', 'Sort': 'relevancerank'},
                  {'cat_id': 6, 'keywords': 'Pants', 'Title': 'Levi\'s', 'SearchIndex': 'FashionMen', 'Sort': 'relevancerank'},
                  {'cat_id': 6, 'keywords': 'Pants', 'Title': 'Lee', 'SearchIndex': 'FashionMen', 'Sort': 'relevancerank'},
                  {'cat_id': 6, 'keywords': 'Jeans', 'Title': 'Levi\'s', 'SearchIndex': 'FashionMen', 'Sort': 'relevancerank'},
                  {'cat_id': 7, 'keywords': 'Women Shoes', 'Title': 'Shoes', 'SearchIndex': 'FashionWomen', 'Sort': 'relevancerank'},
                  {'cat_id': 7, 'keywords': 'Women Shoes', 'Title': 'Converse', 'SearchIndex': 'FashionWomen', 'Sort': 'relevancerank'},
                  {'cat_id': 7, 'keywords': 'Women Shoes', 'Title': 'Stuart Weitzman', 'SearchIndex': 'FashionWomen', 'Sort': 'relevancerank'},
                  {'cat_id': 8, 'keywords': 'Dress', 'Title': 'Adrianna Papell', 'SearchIndex': 'FashionWomen', 'Sort': 'relevancerank'},
                  {'cat_id': 8, 'keywords': 'Dress', 'Title': 'Maggy London', 'SearchIndex': 'FashionWomen', 'Sort': 'relevancerank'},
                  {'cat_id': 9, 'keywords': 'tights', 'Title': 'Merry Style', 'SearchIndex': 'FashionWomen', 'Sort': 'relevancerank'},
                  {'cat_id': 9, 'keywords': 'tights', 'Title': 'Moochi', 'SearchIndex': 'FashionWomen', 'Sort': 'relevancerank'},
                  {'cat_id': 9, 'keywords': 'tights', 'Title': 'Frenchic', 'SearchIndex': 'FashionWomen', 'Sort': 'relevancerank'},
                  {'cat_id': 10, 'keywords': 'shorts', 'Title': 'Calvin Klein', 'SearchIndex': 'FashionWomen', 'Sort': 'relevancerank'},
                  {'cat_id': 10, 'keywords': 'shorts', 'Title': 'Hanes', 'SearchIndex': 'FashionWomen', 'Sort': 'relevancerank'},
                  {'cat_id': 10, 'keywords': 'shorts', 'Title': 'Lee', 'SearchIndex': 'FashionWomen', 'Sort': 'relevancerank'},
                 ]

    count = 0
    for term in terms_list:
        products = amazon.search_n(15, Keywords=term.get('keywords'),
                                   Title=term.get('Title') if term.get('Title') is not None else None,
                                   SearchIndex=term.get('SearchIndex'),
                                   Sort=term.get('Sort'))
        for i, product in enumerate(products):
            try:
                if product.large_image_url is None or product.price_and_currency[0] is None:
                    continue
                item = Item()
                item.name = product.title if product.title is not None else ''
                item.color = product.color if product.color is not None else ''
                item.description = product.editorial_review if product.editorial_review is not None else ''
                item.quantity = random.randint(1, 20)
                item.image = download_file(product.large_image_url)
                item.amazon_id = product.asin
                price = int(product.price_and_currency[0])
                item.price = price
                item.category_id_id = term.get('cat_id')
                item.slug = slugify(product.title)
                item.save()
                count += i
            except IntegrityError:
                continue

    return HttpResponse(count)
    # products = amazon.search_n(1, Keywords='kindle', SearchIndex='All')
    # product = amazon.lookup(ItemId='B01LXU4VO7')

# Create your views here.
