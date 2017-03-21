from django.shortcuts import render
from django.views.generic import ListView
from .models import Category
from item.models import Item
from amazon.api import AmazonAPI


class CategoryView(ListView):
    model = Category
    template_name = "category/category.html"

    def get_queryset(self):

        slug = self.kwargs['slug']
        category = Category.objects.filter(slug=slug)

        return category

    def get_context_data(self, **kwargs):
        context = {}
        category = Category.objects.get(slug=self.kwargs['slug'])
        products = get_products_by_cat_id(category.id, Item.objects.filter(category_id_id=category.id).count())
        context['products'] = products
        return context


def cat(request):
    params = {}
    categories_list = Category.objects.filter(parent_category_id=None)
    products_list = {}
    child_categories_list = {}
    for i in categories_list:
        products = get_products_by_cat_id(i.id, 4)
        products_list[i.id] = products
    params['categories'] = categories_list
    params['products'] = products_list
    params['child_categories'] = child_categories_list
    return render(request, "category/list.html", params)


def get_products_by_cat_id(id, count):
    products = Item.objects.filter(category_id_id=id).order_by('?')[:count]
    return products


def category_by_slug(request, slug, page=1, child_slug=None, **kwargs):
    context = {}
    parent_category = Category.objects.get(slug=slug)
    category = Category.objects.get(slug=child_slug, parent_category_id=parent_category.id)
    start_element = 0 if int(page) == 1 else (int(page)-1)*12
    end_element = int(page)*12
    products = Item.objects.filter(category_id_id=category.id).order_by('id')
    brands = Item.objects.filter(category_id_id=category.id).values('brand').distinct()
    count = products.count()
    products_list = products[start_element:end_element]
    context['brands'] = brands
    context['category'] = category
    context['products'] = products_list
    context['products_count'] = count
    context['current_page'] = int(page)
    context['pages_count'] = range(1, int(round(count / 12) + 1))
    context['parent_category'] = parent_category
    return render(request, "category/category.html", context)


def categories_child_list(request, slug):
    params = {}
    parent_category = Category.objects.get(slug=slug)
    categories_list = Category.objects.filter(parent_category_id=parent_category.id)
    products_list = {}
    for i in categories_list:
        products = get_products_by_cat_id(i.id, 4)
        products_list[i.id] = products
    params['categories'] = categories_list
    params['products'] = products_list
    params['parent_category'] = parent_category
    return render(request, "category/child_list.html", params)


def get_amazon(request):
    context = {}
    amazon = AmazonAPI('AKIAJWTF2DL2JCDJHFFQ', '2Pv0/KbNj5OwG6otEyg52zB9ZY3O+oWJWpzc8d+2', 'nekaravaev-20')
    product = amazon.lookup(ItemId='B01LXU4VO7')
    context['item'] = product

    return render(request, "item/amazon-item.html", context)
# Create your views here.
