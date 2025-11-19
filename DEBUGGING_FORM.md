# Debugging Form Product - Panduan Troubleshooting

## ✅ Perbaikan yang Sudah Dilakukan

### 1. **URL Endpoint Fixed**
```dart
❌ BEFORE: 'http://localhost:8000/api/products/create/'
✅ AFTER:  'http://10.0.2.2:8000/api/products/create/'
```
- `localhost` hanya works di device sendiri, tidak di emulator
- `10.0.2.2` adalah magic IP untuk akses host dari Android emulator

### 2. **Loading State Added**
```dart
bool _isLoading = false;  // ← Track loading state

// Button status
onPressed: _isLoading ? null : () async { ... }

// Show loading indicator
child: _isLoading
    ? CircularProgressIndicator()  // ← Show spinner saat loading
    : Text("Simpan")
```

### 3. **Debug Logging Added**
```dart
print('DEBUG: Starting POST request');
print('DEBUG: URL = http://10.0.2.2:8000/api/products/create/');
print('DEBUG: Data = name: $_name, price: $_price, category: $_category');
print('DEBUG: Response received = $response');
```

### 4. **Better Error Handling**
```dart
try {
  // POST request
} catch (e) {
  print('DEBUG: Exception caught = $e');  // ← Print error detail
  showSnackBar(error message);            // ← Show to user
} finally {
  setState(() { _isLoading = false; });   // ← Always reset loading state
}
```

---

## 🧪 Cara Testing Form

### **Step 1: Run Flutter App**
```bash
flutter run
```

### **Step 2: Login ke App**
- Buka app → Login page
- Masukkan username & password Anda

### **Step 3: Navigate ke Create Product**
- Click "Create Product" card di menu
- Form page akan dibuka

### **Step 4: Fill All Fields**
```
Nama Produk:      Jersey Manchester United
Harga:            250000
Deskripsi:        Official jersey MU 2024/2025
URL Thumbnail:    https://example.com/image.jpg (valid URL!)
Kategori:         Jersey
Stok:             50
Brand:            Adidas
Tahun Rilis:      2024
Ukuran:           L
Tipe Edisi:       Replica
Kondisi:          New
Sertifikat:       ON/OFF (toggle)
Featured:         ON/OFF (toggle)
Tingkat Langka:   Common
```

### **Step 5: Click SIMPAN Button**
- Button akan jadi **disabled** (grayed out)
- Akan show **spinning indicator** di button
- Check **console output** untuk debug messages:

```
flutter: DEBUG: Starting POST request
flutter: DEBUG: URL = http://10.0.2.2:8000/api/products/create/
flutter: DEBUG: Data = name: Jersey Manchester United, price: 250000, ...
flutter: DEBUG: Response received = {success: true, message: ...}
flutter: DEBUG: Success from status field = true
```

### **Step 6: Expected Output**
- ✅ Green SnackBar: "Produk berhasil ditambahkan!"
- ✅ Auto-redirect ke MenuPage after 1 second
- ✅ Form akan clear

---

## 🐛 Common Issues & Solutions

### **Issue 1: Button Tidak Merespons**
```
Gejala:  Click tombol Simpan, tidak ada perubahan
Penyebab: 
  - Form validation gagal
  - JavaScript error di console
  
Solusi:
  1. Check console untuk error message
  2. Pastikan semua field warna merah diperbaiki
  3. Check URL Thumbnail format (harus https://...)
```

### **Issue 2: Spinner Terus Muter (Hang)**
```
Gejala:  Loading indicator tidak berhenti
Penyebab:
  - Django server tidak running
  - URL endpoint salah
  - Network error
  
Solusi:
  1. Check Django running: python manage.py runserver
  2. Verify URL: http://10.0.2.2:8000 (bukan localhost!)
  3. Check console untuk error message
  4. Cek network di terminal
```

### **Issue 3: Error Message dari Backend**
```
Gejala:  Red SnackBar: "Gagal menambahkan produk"
Penyebab:
  - Validation error di Django
  - User tidak authenticated
  - Database error
  
Solusi:
  1. Check Django server logs untuk error detail
  2. Pastikan sudah login
  3. Test endpoint dengan curl:
     curl -X POST http://10.0.2.2:8000/api/products/create/ \
       -d "name=Test&price=100&..."
```

### **Issue 4: Produk Tidak Muncul di List**
```
Gejala:  Form berhasil, tapi produk tidak di list
Penyebab:
  - Django endpoint /api/products/ tidak running
  - Products endpoint punya bug
  - Database issue
  
Solusi:
  1. Check ProductEntryList fetching dengan benar
  2. Test GET endpoint:
     curl http://10.0.2.2:8000/api/products/
  3. Check database: SELECT * FROM products_product;
```

---

## 📊 Console Debug Messages Explained

### **Success Flow:**
```
flutter: DEBUG: Starting POST request
  ↓ (form akan disable, spinner show)
flutter: DEBUG: URL = http://10.0.2.2:8000/api/products/create/
flutter: DEBUG: Data = name: Jersey..., price: 250000, ...
  ↓ (waiting for server response)
flutter: DEBUG: Response received = {status: success, message: ..., data: {...}}
flutter: DEBUG: Success from status field = true
  ↓ (response is success)
✅ GREEN SnackBar: "Produk berhasil ditambahkan!"
  ↓ (wait 1 second)
🔄 Navigate back to MenuPage
```

### **Error Flow:**
```
flutter: DEBUG: Starting POST request
  ↓ (form akan disable, spinner show)
flutter: DEBUG: URL = http://10.0.2.2:8000/api/products/create/
flutter: DEBUG: Data = name: Jersey..., price: 250000, ...
  ↓ (waiting for server response)
flutter: DEBUG: Response received = {status: error, message: "Validation error", errors: {...}}
flutter: DEBUG: Success from status field = false
  ↓ (response is error)
❌ RED SnackBar: "Validation error"
  ↓ (button enable again)
🔄 User bisa edit form dan retry
```

### **Exception Flow:**
```
flutter: DEBUG: Starting POST request
  ↓
flutter: DEBUG: Exception caught = SocketException: Connection refused
  ↓ (network error = Django not running)
❌ RED SnackBar: "Error: SocketException..."
  ↓
🔄 User bisa retry setelah Django up
```

---

## 🔍 Advanced Debugging

### **1. Print Full Response**
Edit file, tambah di catch section:
```dart
print('DEBUG: Full Response = $response');
print('DEBUG: Response Type = ${response.runtimeType}');
if (response is Map) {
  print('DEBUG: Response Keys = ${response.keys}');
  response.forEach((key, value) {
    print('DEBUG: $key = $value');
  });
}
```

### **2. Check Network in Android Studio Logcat**
```
Open: View → Tool Windows → Logcat
Filter: "flutter" or "http"
See: All network requests & responses
```

### **3. Use Device Network Monitor**
```bash
# Di terminal, monitor network traffic
adb shell dumpsys connectivity
```

### **4. Test Endpoint Manually**
```bash
# Test Django endpoint dengan curl
curl -X POST http://10.0.2.2:8000/api/products/create/ \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "name=Test&price=100&description=Desc&thumbnail=https://example.com/img.jpg&category=jersey&stock=10&brand=Adidas&release_year=2024&size=L&edition_type=replica&condition=new&authenticity_certificate=false&rarity_level=common&is_featured=false"
```

---

## ✨ Checklist Sebelum Submit

- [ ] All required fields filled (name, price, desc, thumb, category, stock, etc)
- [ ] Price adalah angka positif (e.g. 250000)
- [ ] Thumbnail URL valid (start with https://)
- [ ] Django server running: `python manage.py runserver`
- [ ] Django endpoint available: `/api/products/create/`
- [ ] User sudah login (have session cookie)
- [ ] Network connection OK
- [ ] Check console for DEBUG messages
- [ ] SnackBar shows success message (green)
- [ ] Auto-redirect ke MenuPage happens
- [ ] Product appears di ProductEntryList

---

## 📞 Kalau Masih Stuck

1. **Check console output** - Copy paste semua DEBUG messages
2. **Check Django logs** - Lihat error di Django terminal
3. **Test endpoint** - Gunakan curl untuk test `/api/products/create/`
4. **Verify database** - Check product sudah ada di database
5. **Check network** - Pastikan `10.0.2.2:8000` accessible

**Common fix**: 90% masalah adalah:
- ✅ URL salah (use `10.0.2.2` not `localhost`)
- ✅ Django not running
- ✅ Endpoint not exist (need create views)
- ✅ User not authenticated (need login first)
