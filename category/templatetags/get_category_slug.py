from django.template.defaulttags import register
from category.models import Category


@register.filter
def get_category_slug(cat_id):
    category = Category.objects.get(id=cat_id)
    return category.slug
