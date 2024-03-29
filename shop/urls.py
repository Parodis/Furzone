"""shop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from shop.views import *
from contact.views import ContactCreate
from user.views import *
from newsletters.views import send
from cart.views import *
from category.views import *
from item.views import get_item, fetch_items_from_amazon, filter_items
from profiles.views import *
from order.views import *

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', Home.as_view(), name='home'),
    url(r'^contact/$', ContactCreate, name='contact'),
    url(r'^about$', About.as_view(), name='about'),
    url(r'^login/$', login_in, name="log in"),
    url(r'^newsletters/$', send, name="newsletters"),
    url(r'^cart/$', show, name="cart"),
    url(r'^category/$', cat, name="categories"),
    url(r'^product-filter/$', filter_items, name="filter"),
    url(r'^category/(?P<slug>[-\w]+)/$', categories_child_list, name="child categories list"),
    url(r'^category/(?P<slug>[-\w]+)/(?P<child_slug>[-\w]+)/$', category_by_slug, name="category view"),
    url(r'^category/(?P<slug>[-\w]+)/(?P<child_slug>[-\w]+)/(?P<page>[\d]+)/$', category_by_slug, name="category page"),
    url(r'^category/(?P<slug>[-\w]+)/(?P<child_slug>[-\w]+)/(?P<product_slug>[-\w]+)/$', get_item, name="product"),
    url(r'^amazon/$', get_amazon, name="amazon"),
    url(r'^search/', include('search.urls')),
    url(r'^register/$', register, name='register'),
    url(r'^parse/$', fetch_items_from_amazon, name="parse"),
    url(r'^account/$', Account.as_view(), name='account'),
    url(r'^account/edit/$', edit_account, name='edit'),
    url(r'^add/$', add, name='add'),
    url(r'^order/$', order, name='order'),
    url(r'^logout/$', logout_view, name='logout'),
    url(r'^remove/$', remove, name='remove')
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
