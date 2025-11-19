# Django API Requirements untuk Football Collectibles Mobile App

⚠️ **UPDATE:** Endpoint `/api/products/create/` returning **404 Not Found**

Berikut adalah API endpoints yang diperlukan di backend Django untuk agar aplikasi Flutter berfungsi dengan baik.

## Base URL
```
http://localhost:8000/api/
```

---

## ⚡ QUICK FIX - Create Endpoint Sekarang

### 1️⃣ **Buat/Edit views.py**

## ⚡ QUICK FIX - Create Endpoint Sekarang

### 1️⃣ **Buat/Edit views.py**

Lokasi: `your_app/views.py` (ganti `your_app` dengan nama app Anda)

```python
# your_app/views.py

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods
import json

@csrf_exempt  # Temporary - untuk testing
@require_http_methods(["POST"])
def create_product(request):
    """
    TEMPORARY endpoint untuk testing Flutter form
    Nanti ganti dengan proper authentication & validation
    """
    try:
        # Print untuk debug
        print("=" * 50)
        print("POST /api/products/create/ received!")
        print("POST data:", request.POST)
        print("=" * 50)
        
        # Extract data
        name = request.POST.get('name', '')
        price = request.POST.get('price', '0')
        
        # Return success response
        return JsonResponse({
            'status': 'success',
            'message': f'Product "{name}" received! (Price: {price})',
            'data': {
                'id': '123',  # Dummy ID for now
                'name': name,
                'price': price,
            }
        }, status=201)
        
    except Exception as e:
        print(f"Error: {str(e)}")
        return JsonResponse({
            'status': 'error',
            'message': f'Error: {str(e)}'
        }, status=500)
```

### 2️⃣ **Update urls.py**

Lokasi: `your_app/urls.py` atau `football_collectibles/urls.py`

**Option A - Di app urls.py:**
```python
# your_app/urls.py

from django.urls import path
from . import views

urlpatterns = [
    # Existing URLs...
    
    # Add this:
    path('api/products/create/', views.create_product, name='create_product'),
]
```

**Option B - Di main urls.py:**
```python
# football_collectibles/urls.py

from django.contrib import admin
from django.urls import path, include
from your_app import views  # Ganti your_app

urlpatterns = [
    path('admin/', admin.site.urls),
    # ... existing patterns ...
    
    # Add this:
    path('api/products/create/', views.create_product, name='create_product'),
]
```

### 3️⃣ **Restart Django Server**

```bash
# Stop server (Ctrl+C)
# Start again:
python manage.py runserver
```

### 4️⃣ **Test Flutter Lagi**

```bash
# Di Flutter terminal, hot reload:
r

# Or restart:
flutter run
```

Fill form → Click Simpan → Should work now! ✅

---

## 🔧 AFTER TESTING WORKS - Proper Implementation

Once basic endpoint works, implement properly:

### **Production-Ready views.py**
**Endpoint:** `GET /api/products/`

**Deskripsi:** Ambil daftar semua produk

**Request:** 
```
GET http://localhost:8000/api/products/
```

**Response Success (200):**
```json
[
  {
    "id": "uuid-string",
    "name": "Jersey Manchester United",
    "price": 500000,
    "description": "Jersey authentic MU 2023",
    "thumbnail": "https://...",
    "category": "jersey",
    "is_featured": true,
    "stock": 10,
    "brand": "Adidas",
    "release_year": 2023,
    "size": "m",
    "edition_type": "replica",
    "condition": "new",
    "authenticity_certificate": false,
    "rarity_level": "common",
    "user_id": 1
  },
  ...
]
```

---

## 2. GET - Produk User yang Login
**Endpoint:** `GET /api/products/user/`

**Deskripsi:** Ambil produk hanya milik user yang login (authenticated)

**Authentication:** Memerlukan session/cookie dari login

**Request:**
```
GET http://localhost:8000/api/products/user/
```

**Response Success (200):**
```json
[
  {
    "id": "uuid-string",
    "name": "Jersey Liverpool",
    "price": 450000,
    ...
  }
]
```

---

## 3. POST - Buat Produk Baru
**Endpoint:** `POST /api/products/create/`

**Deskripsi:** Buat produk baru untuk user yang login

**Authentication:** Memerlukan session/cookie dari login

**Request:**
```
POST http://localhost:8000/api/products/create/
Content-Type: application/x-www-form-urlencoded

name=Jersey Chelsea&price=450000&description=Jersey authentic Chelsea...&thumbnail=https://...&category=jersey&stock=10&brand=Nike&release_year=2024&size=l&edition_type=replica&condition=new&authenticity_certificate=false&rarity_level=rare&is_featured=true
```

**Form Data:**
```
- name: string (max 100)
- price: integer (>= 0)
- description: string
- thumbnail: string (valid URL)
- category: string (jersey|scarves_banner|footballs|autographed|second_hand|limited_edition|authentic_retail|replica_jersey|match_worn)
- stock: integer (>= 0)
- brand: string (max 50, optional)
- release_year: integer (optional)
- size: string (s|m|l|xl|xxl, optional)
- edition_type: string (replica|limited|secondhand)
- condition: string (new|like_new|good)
- authenticity_certificate: boolean
- rarity_level: string (common|rare|legendary)
- is_featured: boolean
```

**Response Success (200/201):**
```json
{
  "status": "success",
  "message": "Product created successfully",
  "id": "uuid-string",
  "data": {
    "id": "uuid-string",
    "name": "Jersey Chelsea",
    "price": 450000,
    ...
  }
}
```

**Response Error (400/500):**
```json
{
  "status": "error",
  "message": "Field validation error",
  "errors": {
    "name": ["Name tidak boleh kosong"],
    "price": ["Price harus berupa angka"]
  }
}
```

---

## Django Implementation Example

### models.py
```python
from django.db import models
from django.contrib.auth.models import User
import uuid

class Product(models.Model):
    CATEGORY_CHOICES = [
        ('jersey', 'Jersey'),
        ('scarves_banner', 'Scarves or Banners'),
        ('footballs', 'Collector Footballs'),
        ('autographed', 'Autographed Memorabilia'),
        ('second_hand', 'Second-Hand Collectible'),
        ('limited_edition', 'Limited Edition Item'),
        ('authentic_retail', 'Authentic Retail Jersey'),
        ('replica_jersey', 'Replica Jersey'),
        ('match_worn', 'Match-Worn Jersey'),
    ]
    
    SIZE_CHOICES = [
        ('s', 'S'),
        ('m', 'M'),
        ('l', 'L'),
        ('xl', 'XL'),
        ('xxl', 'XXL'),
    ]
    
    EDITION_CHOICES = [
        ('replica', 'Replica'),
        ('limited', 'Limited Edition'),
        ('secondhand', 'Second Hand'),
    ]
    
    CONDITION_CHOICES = [
        ('new', 'New'),
        ('like_new', 'Like New'),
        ('good', 'Good'),
    ]
    
    RARITY_CHOICES = [
        ('common', 'Common'),
        ('rare', 'Rare'),
        ('legendary', 'Legendary'),
    ]
    
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    price = models.IntegerField()
    description = models.TextField()
    thumbnail = models.URLField()
    category = models.CharField(max_length=20, choices=CATEGORY_CHOICES)
    is_featured = models.BooleanField(default=False)
    stock = models.PositiveIntegerField(default=0)
    brand = models.CharField(max_length=50, blank=True)
    release_year = models.IntegerField(blank=True, null=True)
    size = models.CharField(max_length=3, choices=SIZE_CHOICES, blank=True)
    edition_type = models.CharField(max_length=20, choices=EDITION_CHOICES, default='replica')
    condition = models.CharField(max_length=20, choices=CONDITION_CHOICES, default='new')
    authenticity_certificate = models.BooleanField(default=False)
    rarity_level = models.CharField(max_length=20, choices=RARITY_CHOICES, default='common')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.name
```

### views.py
```python
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_http_methods
from .models import Product
from .serializers import ProductSerializer

@api_view(['GET'])
@require_http_methods(["GET"])
def product_list(request):
    """Get all products"""
    products = Product.objects.all()
    serializer = ProductSerializer(products, many=True)
    return Response(serializer.data)

@api_view(['GET'])
@require_http_methods(["GET"])
@login_required
def user_products(request):
    """Get products of logged-in user"""
    products = Product.objects.filter(user=request.user)
    serializer = ProductSerializer(products, many=True)
    return Response(serializer.data)

@api_view(['POST'])
@require_http_methods(["POST"])
@login_required
def create_product(request):
    """Create new product for logged-in user"""
    data = request.POST.dict()
    data['user'] = request.user.id
    
    serializer = ProductSerializer(data=data)
    if serializer.is_valid():
        serializer.save(user=request.user)
        return Response({
            'status': 'success',
            'message': 'Product created successfully',
            'data': serializer.data
        }, status=status.HTTP_201_CREATED)
    else:
        return Response({
            'status': 'error',
            'message': 'Validation error',
            'errors': serializer.errors
        }, status=status.HTTP_400_BAD_REQUEST)
```

### urls.py
```python
from django.urls import path
from . import views

app_name = 'api'

urlpatterns = [
    path('products/', views.product_list, name='product_list'),
    path('products/user/', views.user_products, name='user_products'),
    path('products/create/', views.create_product, name='create_product'),
]
```

---

## Notes untuk Flutter App

1. **Endpoints yang digunakan:**
   - `GET /api/products/` → All Products
   - `GET /api/products/user/` → My Products (filter by login user)
   - `POST /api/products/create/` → Create Product

2. **Authentication:**
   - Gunakan CookieRequest dari pbp_django_auth
   - Session cookie akan otomatis di-attach pada setiap request

3. **Response Format:**
   - List endpoint: Return array langsung
   - Create endpoint: Return object dengan `status`, `message`, `data`

4. **Boolean handling:**
   - Flutter send: `"true"` atau `"false"` (string)
   - Django receive: Terima sebagai string, convert ke boolean

5. **Testing endpoints:**
```bash
# Test GET all products
curl http://localhost:8000/api/products/

# Test GET user products (perlu login)
curl -b cookies.txt http://localhost:8000/api/products/user/

# Test POST create
curl -X POST http://localhost:8000/api/products/create/ \
  -b cookies.txt \
  -d "name=Jersey&price=500000&description=..."
```

---

## Common Issues & Solutions

### Issue: Product tidak tersimpan
**Solutions:**
1. Cek endpoint URL benar
2. Cek user sudah login (session valid)
3. Cek format data (pastikan boolean jadi string)
4. Cek validation di Django model

### Issue: Error 403 Forbidden
**Solutions:**
1. Pastikan user sudah login
2. Cek CSRF token (kalau pakai Django forms)
3. Cek permission settings di views

### Issue: Image tidak load
**Solutions:**
1. Cek URL thumbnail valid
2. Cek CORS settings kalau image dari domain lain
3. Gunakan error builder untuk handle image error

