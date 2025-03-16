from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('register', views.register, name='account.register'),
    path('login', views.user_login, name='account.login'),
    path('logout', views.user_logout, name='account.logout'),
    path('profile', views.profile_management, name="account.profile"),
    path('delete', views.delete_account, name="account.delete"),

# Password management urls/view
    # 1. Submit your email form
    path('reset_password', auth_views.PasswordResetView.as_view(template_name="account/password/reset.html"), name="reset_password"),

    # 2. Success message stating that a password reset email was sent
    path('reset_password_sent', auth_views.PasswordResetDoneView.as_view(template_name="account/password/reset_sent.html"), name="password_reset_done"),

    # 2. Password reset link
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name="account/password/reset_form.html"), name="password_reset_confirm"),

    # 2. Success message stating that our password was reset
    path('reset_password_complete', auth_views.PasswordResetCompleteView.as_view(template_name="account/password/reset_complete.html"), name="password_reset_complete"),

    path('email-verifications/<str:uidb64>/<str:token>/', views.email_verification, name='account.email_verification'),
    path('email-verification-sent', views.email_verification_sent, name='account.email_verification_sent'),
    path('email-verification-success', views.email_verification_success, name='account.email_verification_success'),
    path('email-verification-failed', views.email_verification_failed, name='account.email_verification_failed'),
]