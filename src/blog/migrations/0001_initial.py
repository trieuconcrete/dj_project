# Generated by Django 5.1.4 on 2025-03-13 12:41

import autoslug.fields
import ckeditor_uploader.fields
import django.db.models.deletion
import django.utils.timezone
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name="Category",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=255)),
                (
                    "slug",
                    autoslug.fields.AutoSlugField(
                        default=None,
                        editable=False,
                        null=True,
                        populate_from="name",
                        unique=True,
                    ),
                ),
            ],
            options={
                "verbose_name_plural": "Categories",
                "db_table": "categories",
            },
        ),
        migrations.CreateModel(
            name="Tag",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=100)),
            ],
            options={
                "db_table": "tags",
            },
        ),
        migrations.CreateModel(
            name="Post",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("title", models.CharField(max_length=200)),
                (
                    "slug",
                    autoslug.fields.AutoSlugField(
                        default=None,
                        editable=False,
                        null=True,
                        populate_from="title",
                        unique=True,
                    ),
                ),
                ("image", models.ImageField(upload_to="images/")),
                ("content", ckeditor_uploader.fields.RichTextUploadingField()),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                (
                    "status",
                    models.CharField(
                        choices=[("0", "DRAFT"), ("1", "PUBLISH")],
                        default=0,
                        max_length=1,
                    ),
                ),
                (
                    "section",
                    models.CharField(
                        choices=[
                            ("Popular", "Popular"),
                            ("Recent", "Recent"),
                            ("Trending", "Trending"),
                        ],
                        max_length=100,
                    ),
                ),
                ("main_post", models.BooleanField(default=False)),
                ("views", models.PositiveBigIntegerField(default=0)),
                (
                    "author",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="categories",
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
                (
                    "category",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="categories",
                        to="blog.category",
                    ),
                ),
                (
                    "tags",
                    models.ManyToManyField(
                        blank=True, null=True, related_name="posts", to="blog.tag"
                    ),
                ),
            ],
            options={
                "verbose_name_plural": "Posts",
                "db_table": "posts",
            },
        ),
        migrations.CreateModel(
            name="Comment",
            fields=[
                ("id", models.AutoField(primary_key=True, serialize=False)),
                ("name", models.CharField(max_length=255)),
                ("email", models.EmailField(max_length=254)),
                ("website", models.CharField(blank=True, max_length=255, null=True)),
                ("comment", models.TextField()),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                (
                    "parent",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="replies",
                        to="blog.comment",
                    ),
                ),
                (
                    "user",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="auth_users",
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
                (
                    "post",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="posts",
                        to="blog.post",
                    ),
                ),
            ],
            options={
                "db_table": "comments",
            },
        ),
        migrations.CreateModel(
            name="Reply",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("user", models.CharField(max_length=100)),
                ("content", models.TextField()),
                ("created_at", models.DateTimeField(default=django.utils.timezone.now)),
                (
                    "comment",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="comments",
                        to="blog.comment",
                    ),
                ),
            ],
        ),
    ]
