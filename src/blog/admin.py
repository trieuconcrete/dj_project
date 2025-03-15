from django.contrib import admin
from .models import Post, Category, Comment, Tag

class PostAdmin(admin.ModelAdmin):
    list_display = ['title', 'category', 'main_post', 'created_at']
    search_fields = ['title']

    class Media:
        js = ('ckeditor/ckeditor-init.js', 'ckeditor/ckeditor.js')  # Ensure these paths are correct


# Register your models here.
admin.site.register(Category)
admin.site.register(Post, PostAdmin)
admin.site.register(Comment)
admin.site.register(Tag)
