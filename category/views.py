from django.shortcuts import render
from django.views.generic import ListView
from .models import Category
from item.models import Item


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
    categories_list = Category.objects.all()
    products_list = {}
    for i in categories_list:
        products = get_products_by_cat_id(i.id, 4)
        products_list[i.id] = products
    params['categories'] = categories_list
    params['products'] = products_list
    return render(request, "category/list.html", params)


def get_products_by_cat_id(id, count):
    products = Item.objects.filter(category_id_id=id).order_by('?')[:count]
    return products


def category_by_slug(request, slug, page=1):
    context = {}
    category = Category.objects.get(slug=slug)
    startEl = 0 if int(page) == 1 else (int(page)-1)*10
    endEl = int(page)*10
    products = Item.objects.filter(category_id_id=category.id).order_by('id')[startEl:endEl]
    context['category'] = category
    context['products'] = products

    return render(request, "category/category.html", context)

# Create your views here.
