from django.shortcuts import render
from .models import Category, Product
from django.shortcuts import get_object_or_404
from django.db.models import Count

# Create your views here.

def index(request):
    products = Product.objects.all()
    categories = Category.objects.annotate(product_count=Count('products')).all()
    top_products = Product.objects.order_by('created_at')[0:3]

    context = {
        'products': products,
        'categories': categories,
        'top_products': top_products
    }
    return render(request, 'shops/index.html', context)


def product_detail(request, slug):
    categories = Category.objects.annotate(product_count=Count('products')).all()
    top_products = Product.objects.order_by('created_at')[0:3]

    product = get_object_or_404(Product, slug=slug)

    context = {
        'product': product,
        'categories': categories,
        'top_products': top_products
    }
    return render(request, 'shops/product_detail.html', context)


def cart(request):
    return render(request, 'shops/cart.html')