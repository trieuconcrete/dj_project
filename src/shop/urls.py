from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='shop.index'),
    path('product/<slug:slug>/', views.product_detail, name="shop.product_detail"),
    path('cart/', views.cart, name='shop.cart'),

    path('cart/add/', views.cart_add, name="shop.cart_add"),

    path('cart/delete/', views.cart_delete, name="shop.cart_delete"),

    path('cart/update/', views.cart_update, name="shop.cart_update"),

    path('order/checkout/', views.checkout, name="shop.order_checkout"),
    path('complete-order', views.order_complete, name="shop.order_complete"),
    path('order/success/', views.order_success, name="shop.order_success"),
    path('order/failed/', views.order_failed, name="shop.order_failed"),
]