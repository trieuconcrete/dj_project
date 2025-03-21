from django.shortcuts import render
from .models import Category, Product, Order, OrderItem, ShippingAddress
from django.shortcuts import get_object_or_404
from django.db.models import Count
from django.http import JsonResponse
from .cart import Cart
from .forms import ShippingForm
from django.core.mail import send_mail
from django.conf import settings

# Create your views here.

def index(request):
    products = Product.objects.all()
    categories = Category.objects.annotate(product_count=Count('products')).all()
    top_products = Product.objects.order_by('created_at')[0:3]

    context = {
        'products': products,
        'categories': categories,
        'top_products': top_products
    }
    return render(request, 'shops/index.html', context)


def product_detail(request, slug):
    categories = Category.objects.annotate(product_count=Count('products')).all()
    top_products = Product.objects.order_by('created_at')[0:3]

    product = get_object_or_404(Product, slug=slug)

    context = {
        'product': product,
        'categories': categories,
        'top_products': top_products
    }
    return render(request, 'shops/product_detail.html', context)


def cart(request):
    cart = Cart(request)

    context = {
        'cart': cart
    }
    return render(request, 'shops/cart.html', context)


def cart_add(request):
    cart = Cart(request)
    if request.POST.get('action') == 'post':
        product_id = int(request.POST.get('product_id'))
        product_quantity = int(request.POST.get('product_quantity'))

        product = get_object_or_404(Product, id=product_id)
        cart.add(product=product, product_qty=product_quantity)

        cart_quantity = cart.__len__()

        response = JsonResponse({
            'cart_quantity': cart_quantity
        })
        return response
    else:
        return JsonResponse({'error': 'Invalid or missing action'}, status=400)


def cart_delete(request):
    cart = Cart(request)
    if request.POST.get('action') == 'post':
        product_id = int(request.POST.get('product_id'))
        print(product_id)
        cart.delete(product=product_id)

        cart_quantity = cart.__len__()
        cart_total = cart.get_total()

        response = {
            'qty': cart_quantity,
            'total': cart_total
        }

        return JsonResponse(response)
    else:
        return JsonResponse({'error': 'Invalid or missing action'}, status=400)


def cart_update(request):
    cart = Cart(request)
    if request.POST.get('action') == 'post':
        product_id = int(request.POST.get('product_id'))
        product_quantity = int(request.POST.get('product_quantity'))
        print(product_quantity)

        cart.update(product=product_id, qty=product_quantity)

        cart_quantity = cart.__len__()
        cart_total = cart.get_total()

        response = {
            'qty': cart_quantity,
            'total': cart_total
        }

        return JsonResponse(response)
    else:
        return JsonResponse({'error': 'Invalid or missing action'}, status=400)

def checkout(request):
    # Users with accounts -- Pre-fill the form
    if request.user.is_authenticated:

        try:

            # Authenticated users WITH shipping information
            shipping_address = ShippingAddress.objects.get(user=request.user.id)

            context = {'shipping': shipping_address}

            return render(request, 'shops/order/checkout.html', context)
        except:

            # Authenticated users with No shipping information
            return render(request, 'shops/order/checkout.html')


def order_complete(request):
    if request.POST.get('action') == 'post':

        status = request.POST.get('status')
        payment_method = request.POST.get('payment_method')
        name = request.POST.get('name')
        email = request.POST.get('email')
        address1 = request.POST.get('address1')
        address2 = request.POST.get('address2')
        city = request.POST.get('city')
        state = request.POST.get('state')
        zipcode = request.POST.get('zipcode')

        # All-in-one shipping address
        shipping_address = (address1 + '\n' + address2 + '\n' +
                            city + '\n' + state + '\n' + zipcode
                            )

        cart = Cart(request)

        # Get the total price of items
        total_cost = cart.get_total()

        '''

            Order variations
            1. Create order -> Account users WITH + WITHOUT shipping information
            2. Create order -> Guest users without an account

        '''

        # # 1. Create order -> Account users WITH + WITHOUT shipping information
        # if request.user.is_authenticated:

        #     order = Order.objects.create(
        #         full_name = name,
        #         email = email,
        #         shipping_address = shipping_address,
        #         amount_paid = total_cost,
        #         user = request.user,
        #     )
        #     order_id = order.pk

        #     for item in cart:
        #         OrderItem.objects.create(
        #             order_id = order_id,
        #             product = item['product'],
        #             quantity = item['qty'],
        #             price = item['price'],
        #             user = request.user
        #         )
        # # 2. Create order -> Guest users without an account
        # else:

        #     order = Order.objects.create(
        #         full_name = name,
        #         email = email,
        #         shipping_address = shipping_address,
        #         amount_paid = total_cost,
        #     )
        #     order_id = order.pk

        #     for item in cart:
        #         OrderItem.objects.create(
        #             order_id = order_id,
        #             product = item['product'],
        #             quantity = item['qty'],
        #             price = item['price'],
        #         )

        # Create order data
        order_data = {
            "full_name": name,
            "email": email,
            "shipping_address": shipping_address,
            "amount_paid": total_cost,
            "status": status,
            "payment_method": payment_method,
        }

        # Add user for authenticated users
        if request.user.is_authenticated:
            order_data["user"] = request.user

        # Create the order
        order = Order.objects.create(**order_data)
        order_id = order.pk

        # Create OrderItems in bulk

        order_items = [
            OrderItem(
                order_id=order_id,
                product=item["product"],
                quantity=item["qty"],
                price=item["price"],
                user=request.user if request.user.is_authenticated else None
            )
            for item in cart
        ]

        OrderItem.objects.bulk_create(order_items)

        product_list = []
        for item in cart:
            product_list.append(item['product'])

        all_products = product_list
        # Email order
        send_mail('Order receied', 'Hi!' + '\n\n' + 'Thanh you for placing your order' + '\n\n' +
                  'Please see your order below:' + '\n\n' + str(all_products) + '\n\n' + 'Total price: $' +
                  str(cart.get_total()), settings.EMAIL_HOST_USER, [email], fail_silently=False)

        order_success = True
        response = JsonResponse({'success': order_success})

        return response


def order_success(request):
    for key in list(request.session.keys()):

        if key == 'session_key':
            del request.session[key]

    return render(request,'shops/order/success.html')

def order_failed(request):
    return render(request,'shops/order/failed.html')


