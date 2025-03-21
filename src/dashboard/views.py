from django.shortcuts import render
from blog.models import Post, Comment
from django.db.models import Sum
from django.contrib.auth.decorators import login_required
from django.conf import settings
# Create your views here.

@login_required(login_url=settings.LOGIN_URL)
def dashboard(request):
    total_views = Post.objects.aggregate(total_views=Sum('views'))['total_views']
    total_comments = Comment.objects.count()
    total_posts = Post.objects.count()
    posts = Post.objects.order_by('-id')

    context = {
        'total_views': total_views,
        'total_comments': total_comments,
        'total_posts': total_posts,
        'posts': posts,
    }

    return render(request, 'dashboard/dash.html', context)

def blog(request):
    posts = Post.objects.order_by('-id')

    context = {
        'posts': posts,
    }

    return render(request, 'dashboard/dash_blog.html', context)


def comment(request):
    all_comments = Comment.objects.select_related('post').order_by('-id')

    context = {
        'all_comments': all_comments,
    }

    return render(request, 'dashboard/comments.html', context)

