from django.shortcuts import render, HttpResponseRedirect
from django.views.generic import TemplateView
from .forms import *
from django.contrib.auth.decorators import login_required
from django.core.exceptions import PermissionDenied
from django.db import transaction


class Account(TemplateView):
    template_name = 'account/account.html'


@login_required
@transaction.atomic
def edit_account(request):
    if request.user.is_authenticated():
        if request.method == 'POST':
            user_form = UserForm(request.POST, instance=request.user)
            profile_form = ProfileForm(request.POST, instance=request.user.profile)
            if user_form.is_valid() and profile_form.is_valid():
                user_form.save()
                profile_form.save()
                return HttpResponseRedirect('/account/')
            else:
                user_form = UserForm(instance=request.user)
                profile_form = ProfileForm(instance=request.user.profile)
            return render(request, "account/edit.html", {'user_form': user_form, 'profile_form': profile_form})
        else:
            return render(request, "account/edit.html", {'user_form': UserForm(instance=request.user),
                                                         'profile_form': ProfileForm(instance=request.user.profile)})
    else:
        raise PermissionDenied

# Create your views here.
