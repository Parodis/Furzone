# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-03-12 13:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('item', '0005_auto_20170307_0016'),
    ]

    operations = [
        migrations.AddField(
            model_name='item',
            name='slug',
            field=models.CharField(max_length=40, null=True),
        ),
    ]
