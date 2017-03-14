# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-27 10:51
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('category', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Item',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False, unique=True)),
                ('name', models.CharField(max_length=50)),
                ('description', models.TextField()),
                ('size', models.CharField(choices=[('34', '34'), ('36', '36'), ('38', '38')], max_length=20)),
                ('options', models.TextField()),
                ('quantity', models.IntegerField()),
                ('image', models.ImageField(upload_to='')),
                ('price', models.IntegerField()),
                ('category_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='category.Category')),
            ],
        ),
    ]
