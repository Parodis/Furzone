from django.shortcuts import render
from django.views.generic import TemplateView, CreateView


class Home(TemplateView):
    template_name = "base.html"


class About(TemplateView):
    template_name = "about/about.html"
