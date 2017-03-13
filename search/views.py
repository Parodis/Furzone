from django.shortcuts import render_to_response
from item.models import Item
from django.views.generic import ListView


class SearchView(ListView):
    template_name = 'search/result.html'
    model = Item
    paginate_by = 8

    def get_queryset(self):
        result = super(SearchView, self).get_queryset()
        query = self.request.GET.get('q')
        if query:
            return result.filter(name__icontains=query)
        return result
