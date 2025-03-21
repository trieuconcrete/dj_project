from django.db import models
from django.urls import reverse
from django.contrib.auth.models import User

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=255, db_index=True)
    slug = models.SlugField(max_length=255, db_index=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Category'
        verbose_name_plural = 'Categories'
        db_table = 'shop_categories'

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('shop.category_list', args=[self.slug])

class Brand(models.Model):
    name = models.CharField(max_length=255, db_index=True)
    slug = models.SlugField(max_length=255, db_index=True)
    logo = models.ImageField(upload_to='images', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class Product(models.Model):
    category = models.ForeignKey(Category, related_name='products', on_delete=models.CASCADE, null=True)
    name = models.CharField(max_length=250)
    slug = models.SlugField(max_length=255, db_index=True)
    brand = models.ForeignKey(Brand, related_name='products', on_delete=models.CASCADE, blank=True, null=True)
    description = models.TextField(blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.ImageField(upload_to='images/', blank=True, null=True)
    in_stock = models.BooleanField(blank=True, default=True)
    quantity =models.IntegerField(blank=True, default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Product'
        verbose_name_plural = 'Products'
        db_table = 'shop_products'

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('shop.product_detail', args=[self.slug])
    
class ShippingAddress(models.Model):
    full_name = models.CharField(max_length=300)
    email = models.EmailField(max_length=255)
    address1 = models.CharField(max_length=300)
    address2 = models.CharField(max_length=300)
    city = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    # Optional
    state = models.CharField(max_length=255, blank=True, null=True)
    zipcode = models.CharField(max_length=255, blank=True, null=True)

    user = models.ForeignKey(User, related_name='shipping_addresses', on_delete=models.CASCADE, null=True, blank=True)

    class Meta:
        verbose_name = 'Shipping Address'
        verbose_name_plural = 'Shipping Addresses'
        db_table = 'shop_shipping_addresses'

    def __str__(self):
        return 'Shipping Address - ' + str(self.id)


class Order(models.Model):
    full_name = models.CharField(max_length=300)
    email = models.EmailField(max_length=255)
    shipping_address = models.TextField(500)
    amount_paid = models.DecimalField(max_digits=10, decimal_places=2)
    date_ordered = models.DateTimeField(auto_now_add=True)
    # 1: unpaid order, 2: paid order
    status = models.SmallIntegerField(default=1)
    # 1: COD, 2: Credit card
    payment_method = models.SmallIntegerField(default=1)
    user = models.ForeignKey(User, related_name='orders', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Order'
        verbose_name_plural = 'Orders'
        db_table = 'shop_orders'

    def __str__(self):
        return 'Order - #' + str(self.id)

class OrderItem(models.Model):
    order = models.ForeignKey(Order, related_name='order_items', on_delete=models.CASCADE, null=True, blank=True)
    product = models.ForeignKey(Product, related_name='product_item', on_delete=models.CASCADE, null=True, blank=True)
    user = models.ForeignKey(User, related_name='user_order_item', on_delete=models.CASCADE, null=True, blank=True)
    quantity = models.PositiveBigIntegerField(default=1)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Order Item'
        verbose_name_plural = 'Order Items'
        db_table = 'shop_order_items'

    def __str__(self):
        return 'Order Item - #' + str(self.id)