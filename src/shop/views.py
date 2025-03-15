from django.shortcuts import render

# Create your views here.

def index(request):
    return render(request, 'shops/index.html')

def cart(request):
    return render(request, 'shops/cart.html')