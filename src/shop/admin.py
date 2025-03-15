from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Order)
admin.site.register(OrderItem)

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    # list_display = ('name', 'slug', 'created_at', 'updated_at')
    prepopulated_fields = {'slug': ('name',)}

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    # list_display = ('title', 'slug', 'category', 'brand', 'price', 'in_stock', 'quantity', 'created_at', 'updated_at')
    prepopulated_fields = {'slug': ('title',)}


@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
