from django.template.defaulttags import register
from category.models import Category


@register.filter
def get_parent_category_name(cat_id):
    category = Category.objects.get(id=cat_id)
    parent_category = Category.objects.get(id=category.parent_category_id)
    return parent_category.category.name
