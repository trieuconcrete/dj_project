from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='shop.index'),
    path('cart/', views.cart, name='shop.cart'),
]