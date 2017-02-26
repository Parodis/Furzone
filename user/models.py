from django.db import models

# todo: makemigrations


class User(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    first_name = models.CharField(max_length=100)
    second_name = models.CharField(max_length=100)
    birthday = models.DateField()
    city = models.CharField(max_length=100)
    first_line_adress = models.CharField(max_length=255)
    second_line_adress = models.CharField(max_length=255)
    country = models.CharField(max_length=100)
    postal_code = models.CharField(max_length=10)
    personal_sale = models.IntegerField(default=0)
    email = models.EmailField()
    password = models.CharField(max_length=255)
    sex = models.CharField(choices=(("M", "Male"), ("F", "Female")))
    forgot_key = models.CharField(max_length=255)


class UserOrder(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    cart_id = models.ForeignKey(CartOrder.id)
    user_id = models.ForeignKey(User.id)
    status = models.IntegerField()
    delivery_id = models.ForeignKey(Delivery.id)
    summary = models.IntegerField()
    payment_id = models.ForeignKey(Payment.id)


class CartOrder(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    item_id = models.ForeignKey(Item.id)
    order_id = models.ForeignKey(UserOrder.id)
    quantity = models.IntegerField()


class Item(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    name = models.CharField(max_length=50)
    description = models.TextField()
    # color = models.CharField(max_length=255)
    size = models.CharField(choices=(('34', '34'), ('36', '36'), ('38', '38')))
    options = models.TextField()
    quantity = models.IntegerField()
    image = models.ImageField()
    price = models.IntegerField()
    category_id = models.ForeignKey(Category.id)


class Category(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    name = models.CharField(max_length=50)


class Payment(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    name = models.CharField(max_length=50)


class Delivery(models.Model):
    id = models.IntegerField(unique=True, primary_key=True)
    name = models.CharField(max_length=100)
    price = models.IntegerField()


# Create your models here.
