from django.urls import path
from . import views

urlpatterns = [
    path('', views.dashboard, name="dashboard"),
    path('blog/', views.blog, name="dashboard.blog"),
    path('comment/', views.comment, name="dashboard.comment"),
]
