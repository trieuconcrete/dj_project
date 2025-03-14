from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name="home"),
    path('<str:slug>', views.blog_detail, name="blog.detail"),
    path('category/<str:slug>', views.category, name="category"),
    path('<str:slug>/add_comment/', views.add_comment, name="add_comment"),
]
