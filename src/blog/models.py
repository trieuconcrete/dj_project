from django.db import models
from autoslug import AutoSlugField
from django.utils.text import slugify
from django.utils import timezone
from django.contrib.auth.models import User
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField  # For image upload

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=255)
    slug = AutoSlugField(populate_from='name', unique=True, null=True, default=None)
    description = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = 'Categories'
        db_table = 'categories'

    def save(self, *args, **kwargs):
        if not self.slug:
            base_slug = slugify(self.name)
            self.slug = base_slug
        super().save(*args, **kwargs)


    def __str__(self) -> str:
        return self.name

class Tag(models.Model):
    name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'tags'

class Post(models.Model):
    STAUTS = {
        ('0', 'DRAFT'),
        ('1', 'PUBLISH')
    }

    SECTION = {
        ('Recent', 'Recent'),
        ('Popular', 'Popular'),
        ('Trending', 'Trending')
    }

    POSITION = {
        ('1', 'Top'),
        ('2', 'Right'),
        ('3', 'Left'),
        ('4', 'Middle'),
        ('5', 'Footer')
    }

    title = models.CharField(max_length=200)
    slug = AutoSlugField(populate_from='title', unique=True, null=True, default=None)
    author = models.ForeignKey(User, related_name='categories', on_delete=models.CASCADE)
    image = models.ImageField(upload_to="images/")
    content = RichTextUploadingField()  # Use CKEditor for rich text editing
    category = models.ForeignKey(Category, related_name='categories', on_delete=models.CASCADE)
    tags = models.ManyToManyField(Tag, related_name="posts", blank=True, null=True)
    status = models.CharField(choices=STAUTS, max_length=1, default=0)
    section = models.CharField(choices=SECTION, max_length=100, blank=True, null=True)
    position = models.CharField(choices=POSITION, max_length=1, blank=True, null=True)
    main_post = models.BooleanField(default=False)
    views = models.PositiveBigIntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = 'Posts'
        db_table = 'posts'

    def __str__(self) -> str:
        return f"{self.title} ({self.category})"


class Comment(models.Model):
    id = models.AutoField(primary_key=True)
    post = models.ForeignKey(Post, related_name='posts', on_delete=models.CASCADE)
    user = models.ForeignKey(User, related_name="auth_users", on_delete=models.CASCADE, null=True)
    name = models.CharField(max_length=255)
    email = models.EmailField()
    website = models.CharField(max_length=255, blank=True, null=True)
    comment = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    parent = models.ForeignKey('self', null=True, blank=True, on_delete=models.CASCADE, related_name='replies')

    class Meta:
        db_table = 'comments'

    def __str__(self) -> str:
        return self.name

class Reply(models.Model):
    comment = models.ForeignKey(Comment, on_delete=models.CASCADE, related_name="comments")
    user = models.CharField(max_length=100)
    content = models.TextField()
    created_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f"Reply by {self.user}"
