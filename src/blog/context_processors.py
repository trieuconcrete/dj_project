from .models import Category

def data_common(request):
    categories = Category.objects.all()

    context = {
        'categories': categories
    }

    return context