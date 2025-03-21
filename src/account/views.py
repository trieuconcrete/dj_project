from django.shortcuts import render, redirect
from .forms import CreateUserForm, LoginForm, UpdateUserForm
from django.contrib.sites.shortcuts import get_current_site
from .token import user_tokenizer_generate
from django.template.loader import render_to_string
from django.utils.encoding import force_bytes, force_str
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.contrib.auth.models import User, auth
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.conf import settings
from shop.models import ShippingAddress, OrderItem, Order
from shop.forms import ShippingForm

# Create your views here.
def register(request):
    form = CreateUserForm()
    print(settings.EMAIL_HOST_PASSWORD)
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            user.is_active = True
            user.save()

            # Email verification setup (template)
            current_site = get_current_site(request)
            subject = 'Account verification email'
            message = render_to_string('account/registration/email_verification.html', {
                'user': user,
                'domain': current_site,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': user_tokenizer_generate.make_token(user)
            })
            user.email_user(subject=subject, message=message)

            return redirect('account.email_verification_sent')

    context = {'form': form}

    return render(request, 'account/registration/register.html', context)


def email_verification(request, uidb64, token):
    unique_id = force_str(urlsafe_base64_decode(uidb64))
    user = User.objects.get(pk=unique_id)

    # Success
    if user and user_tokenizer_generate.check_token(user, token):
        user.is_active = True
        user.save()

        return render(request, 'account/registration/email_verification_success.html')
    else:

        return render(request, 'account/registration/email_verification_failed.html')


def email_verification_sent(request):
    return render(request, 'account/registration/email_verification_sent.html')


def email_verification_success(request):
    return render(request, 'account/registration/email_verification_success.html')


def email_verification_failed(request):
    return render(request, 'account/registration/email_verification_failed.html')


def user_login(request):
    form = LoginForm()
    if request.method == 'POST':
        form = LoginForm(request, data=request.POST)
        if form.is_valid():
            username = request.POST.get('username')
            password = request.POST.get('password')

            user = authenticate(request, username=username, password=password)

            # If user is authenticated and active, log them in
            if user is not None:
                if user.is_active:
                    auth.login(request, user)
                    return redirect('dashboard')
                else:
                    messages.error(request, 'Account not active')
            else:
                messages.error(request, 'Invalid credentials')

    context = {'form': form}

    return render(request, 'account/login.html', context)


def user_logout(request):
    # auth.logout(request)
    try:
        for key in list(request.session.keys()):
            if key == 'session_key':

                continue
            else:

                del request.session[key]
    except KeyError:

        pass

    messages.success(request, 'Logout success!')

    return redirect('home')


@login_required(login_url='account/login')
def profile_management(request):
    user_form = UpdateUserForm(instance=request.user)
    if request.method == 'POST':
        user_form = UpdateUserForm(request.POST, instance=request.user)

        if user_form.is_valid():
            user_form.save()

            messages.info(request, 'Account updated!')

            return redirect('account.profile')

    context = {'user_form': user_form}
    return render(request, 'account/profile.html', context)


@login_required(login_url='account/login')
def delete_account(request):
    user = User.objects.get(id=request.user.id)

    user.delete()

    return redirect('home')


@login_required(login_url='account/login')
def manage_shipping(request):
    try:
        # Account user with shipment information
        shipping = ShippingAddress.objects.get(user=request.user.id)

    except ShippingAddress.DoesNotExist:
        # Account user with no shipment information
        shipping = None

    form = ShippingForm(instance=shipping)

    if request.method == 'POST':
        form = ShippingForm(request.POST, instance=shipping)

        if form.is_valid():
            # Assign the user FK on the object
            shipping_user = form.save(commit=False)

            # Adding the FK itself
            shipping_user.user = request.user

            shipping_user.save()

            return redirect('account.shipping')

    context = {'form': form}

    return render(request, 'account/shipping.html', context)


@login_required(login_url='account/login')
def orders(request):
    try:
        orders = Order.objects.prefetch_related("order_items").filter(user=request.user)
        context = {'orders': orders}
        print(request.user)

        return render(request, 'dashboard/orders.html', context)
    except:

        return render(request, 'dashboard/orders.html')