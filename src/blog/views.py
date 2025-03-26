from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse
from .models import Post, Category, Comment

# Create your views here.
def index(request):
    posts = Post.objects.order_by('-id')
    main_post = Post.objects.order_by('-id').filter(main_post=True)[0:1]
    recent = Post.objects.filter(section='Recent').order_by('-id')[:5]
    popular = Post.objects.filter(section='Popular').order_by('-id')[0:5]
    top_posts   = Post.objects.filter(position=1).order_by('created_at')[0:5]

    context = {
        'posts': posts,
        'main_post': main_post,
        'recent': recent,
        'popular': popular,
        'top_posts': top_posts,
    }

    return render(request, 'blogs/index.html', context)


def blog_detail(request, slug):
    post = get_object_or_404(Post, slug = slug)
    # increment view count
    post.views +=1
    post.save()


    comments = Comment.objects.filter(post_id=post.id).order_by('-created_at')

    context = {
        'post': post,
        'comments': comments
    }
    return render(request, 'blogs/blog_detail.html', context)


def category(request, slug):
    blog_cat = Category.objects.filter(slug=slug).first()
    context = {
        'active_category': slug,
        'blog_cat': blog_cat
    }
    print(blog_cat.name)

    return render(request, 'blogs/category.html', context)


def add_comment(request, slug):
    if request.method == 'POST':
        post = get_object_or_404(Post, slug=slug)
        comment = request.POST.get('comment')
        email = request.POST.get('email')
        website = request.POST.get('website')
        name = request.POST.get('name')
        parent_id = request.POST.get('parent_id')
        parent_comment = None

        if parent_id:
            parent_comment = get_object_or_404(Comment, id=parent_id)

        Comment.objects.create(
            post = post,
            name = name,
            comment = comment,
            email = email,
            website = website,
            parent = parent_comment,
        )

        return redirect('blog.detail', slug=post.slug)