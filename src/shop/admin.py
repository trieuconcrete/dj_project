from django.contrib import admin
from .models import *
from django.shortcuts import redirect
from django.contrib import messages
from django.urls import path
from django.utils.html import format_html

# Register your models here.
admin.site.register(Order)
admin.site.register(OrderItem)

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    # list_display = ('name', 'slug', 'created_at', 'updated_at')
    prepopulated_fields = {'slug': ('name',)}

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'category', 'brand', 'price', 'in_stock', 'quantity', 'created_at', 'copy_button')
    list_filter = ('category', 'brand')
    search_fields = ['name', 'category__name']
    actions = ['duplicate_products']
    prepopulated_fields = {'slug': ('name',)}

    def duplicate_products(self, request, queryset):
        for product in queryset:
            product.pk = None  # Đặt ID về None để tạo bản sao mới
            product.name = f"Copy of {product.name}"  # Thêm prefix để phân biệt
            product.save()
        messages.success(request, "Selected products were copied successfully.")

    duplicate_products.short_description = "Copy selected products"

    # def copy_button(self, obj):
    #     return f'<a href="/admin/shop/product/{obj.id}/copy/" class="button">Copy</a>'

    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path('<int:object_id>/copy/', self.copy_product, name='copy_product'),
        ]
        return custom_urls + urls

    def copy_product(self, request, object_id):
        product = Product.objects.get(pk=object_id)
        product.pk = None  # Reset ID để tạo bản sao
        product.title = f"Copy of {product.title}"
        product.save()
        messages.success(request, "Product copied successfully!")
        return redirect('/admin/shop/product/')

    def copy_button(self, obj):
        return format_html('<a class="button" href="{}">Copy</a>', f"/admin/shop/product/{obj.id}/copy/")

    copy_button.allow_tags = True
    copy_button.short_description = "Copy"


@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
