<div align="center">

# **TUGAS 7**

</div>

## **1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.**

Widget tree adalah struktur hierarki yang menggambarkan susunan widget dalam aplikasi Flutter. Setiap widget memiliki hubungan parent (induk) dan child (anak) yang menentukan bagaimana elemen UI ditata dan berinteraksi satu sama lain. Widget tree bersifat immutable, sehingga ketika terjadi perubahan pada state, Flutter tidak mengubah widget lama, tetapi membangun ulang (rebuild) bagian tree yang terpengaruh agar sesuai dengan kondisi terbaru.

Contohnya, **MaterialApp** berfungsi sebagai root widget yang menyediakan tema dan struktur aplikasi. Di dalamnya terdapat **Scaffold** sebagai parent yang mengatur tata letak utama (seperti app bar, body, dan floating action button), sedangkan **AppBar**, **Center**, dan **FloatingActionButton** adalah child widgets yang membentuk tampilan antarmuka. Flutter akan memanggil metode `build()` setiap kali aplikasi dijalankan, state berubah, atau parent di-rebuild, sehingga UI selalu terbarui secara efisien.

## **2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.**

a) **MaterialApp**

Widget ini berfungsi sebagai root widget yang mengatur struktur dasar aplikasi Flutter. MaterialApp menyediakan pengaturan seperti tema, judul, dan halaman awal (home) yang akan ditampilkan.

b) **Scaffold**

Scaffold menyediakan kerangka dasar halaman yang terdiri dari komponen utama seperti AppBar, body, FloatingActionButton, dan elemen visual lainnya.

c) **AppBar**

AppBar merupakan bilah atas halaman yang biasanya berisi toolbar dan dapat menampung widget lain seperti TabBar atau FlexibleSpaceBar. App bar sering digunakan untuk menampilkan judul, ikon tindakan utama dengan IconButton, serta menu tambahan melalui PopupMenuButton untuk aksi yang lebih jarang digunakan.

d) **Padding**

Widget Padding digunakan untuk memberikan jarak atau spasi di sekitar child widget, sehingga tata letak terlihat lebih rapi dan proporsional.

e) **Column**

Column menyusun beberapa widget secara vertikal (dari atas ke bawah). Widget ini umum digunakan untuk menampilkan elemen yang berurutan secara vertikal dalam satu halaman.

f) **Row**

Row digunakan untuk menyusun widget secara horizontal (dari kiri ke kanan). Dalam proyek ini, Row berfungsi menampilkan beberapa InfoCard secara berdampingan.

g) **Card**

Card menampilkan kotak dengan efek bayangan (elevation) yang berfungsi menonjolkan konten di dalamnya. Dalam proyek ini, Card digunakan untuk menampilkan informasi seperti nama, NPM, dan kelas.

h) **Container**

Container adalah widget serbaguna yang digunakan untuk mengatur ukuran, jarak (padding), serta dekorasi pada elemen di dalamnya.

i) **Text**

Text digunakan untuk menampilkan teks di layar, seperti judul aplikasi dan informasi pengguna.

j) **Center**

Center mengatur posisi child widget agar berada di tengah layar secara vertikal dan horizontal.

k) **SizedBox**

SizedBox berfungsi memberikan jarak tetap secara vertikal atau horizontal antar widget.

l) **GridView.count**

GridView.count digunakan untuk menampilkan kumpulan widget dalam bentuk grid dengan jumlah kolom yang telah ditentukan. Dalam proyek ini, grid terdiri dari tiga kolom yang menampilkan beberapa ItemCard.

m) **Material**

Widget Material memberikan efek visual khas Material Design, seperti warna latar belakang, bayangan, serta sudut yang melengkung (border radius).

n) **InkWell**

InkWell adalah area persegi panjang dari Material yang merespons sentuhan pengguna. Widget ini memberikan efek sentuhan (ripple effect) dan mendeteksi aksi klik, seperti ketika pengguna menekan salah satu kartu item.

o) **Icon**

Icon menampilkan ikon grafis yang mewakili fungsi tertentu, seperti ikon shopping bag, add, atau inventory.

p) **SnackBar**

SnackBar menampilkan pesan sementara di bagian bawah layar sebagai respons terhadap aksi pengguna, misalnya ketika menekan kartu item tertentu.

## **3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.**

Widget **MaterialApp** berfungsi sebagai root widget yang mengatur struktur dasar dari sebuah aplikasi Flutter berbasis Material Design. Melalui MaterialApp, pengembang dapat dengan mudah mengatur berbagai aspek penting aplikasi, seperti:

* **Judul aplikasi (title):** Menentukan judul yang digunakan oleh sistem atau ditampilkan di antarmuka.
* **Tema aplikasi (ThemeData):** Mengatur warna, font, dan gaya tampilan keseluruhan agar konsisten sesuai panduan Material Design.
* **Halaman awal (home):** Menentukan halaman pertama yang akan ditampilkan saat aplikasi dijalankan.
* **Navigasi dan routing:** Mengelola perpindahan antar halaman atau layar dengan sistem navigator dan routes.
* **Manajemen lokal (localization):** Mendukung pengaturan bahasa dan format lokal sesuai kebutuhan pengguna.

Dengan menggunakan kelas MaterialApp, pengembang dapat mengakses berbagai widget bawaan Material Design seperti **Scaffold**, **AppBar**, **FloatingActionButton**, dan lainnya untuk membangun tampilan yang menarik, intuitif, dan sesuai standar desain modern.

Widget ini sering digunakan sebagai widget root karena berperan sebagai titik awal (entry point) aplikasi yang menginisialisasi struktur, gaya, serta sistem navigasi secara menyeluruh. Tanpa MaterialApp, banyak fitur penting Flutter seperti tema, routing, dan Material Design components tidak dapat berfungsi dengan baik.

## **4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?**

**StatelessWidget** adalah widget yang tidak memiliki state atau kondisi yang dapat berubah selama aplikasi berjalan. Widget ini bersifat immutable, artinya tampilannya hanya bergantung pada konfigurasi atau data yang diberikan saat dibuat. Jika parent widget di-rebuild atau terjadi perubahan pada konfigurasinya, maka StatelessWidget juga akan di-rebuild. Contoh widget jenis ini antara lain **Text**, **Icon**, dan **Container**.

Sementara itu, **StatefulWidget** adalah widget yang memiliki state yang dapat berubah seiring waktu. Widget ini terdiri dari dua bagian:

* **StatefulWidget** itu sendiri, yang bersifat immutable.
* **State object**, yang menyimpan data atau kondisi yang bisa berubah (mutable state).

Ketika state mengalami perubahan, objek State akan memicu rebuild pada widget agar tampilan menyesuaikan dengan kondisi terbaru. Contoh widget jenis ini meliputi **TextField**, **Checkbox**, dan **AnimatedContainer**.

**Kapan memilih masing-masing:**

* Gunakan **StatelessWidget** untuk tampilan yang statis dan tidak berubah, karena lebih ringan dan efisien.
* Gunakan **StatefulWidget** untuk tampilan yang dinamis, seperti yang perlu merespons interaksi pengguna atau perubahan data.

## **5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?**

**BuildContext** adalah objek yang merepresentasikan posisi suatu widget di dalam widget tree Flutter. Dengan kata lain, BuildContext menunjukkan di mana widget tersebut berada dalam struktur hierarki aplikasi.

BuildContext penting karena berfungsi sebagai **jembatan antara widget dan rendering layer**, memungkinkan widget berinteraksi dengan widget lain di atasnya maupun sistem rendering di bawahnya. Melalui BuildContext, Flutter dapat menemukan widget lain dalam tree, mengakses data dari parent widget, serta mengatur tampilan sesuai konteksnya.

Dalam metode `build(BuildContext context)`, parameter **context** digunakan untuk membangun tampilan berdasarkan lingkungan tempat widget berada. Dengan demikian, BuildContext sangat penting karena memungkinkan setiap widget memahami posisinya dan berfungsi dengan benar dalam keseluruhan struktur aplikasi Flutter.

## **6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".**

**Hot Reload** adalah fitur di Flutter yang memungkinkan pengembang menerapkan perubahan kode secara langsung tanpa menghentikan aplikasi yang sedang berjalan. Fitur ini sangat cepat, biasanya hanya memerlukan sekitar satu detik, dan digunakan untuk memperbaiki bug, membuat UI, atau menambahkan fitur baru. Saat melakukan hot reload, state aplikasi tetap dipertahankan, sehingga tampilan dapat diperbarui tanpa kehilangan data atau posisi halaman. Namun, hot reload tidak dapat digunakan jika aplikasi sudah dihentikan sepenuhnya (terminated).

**Hot Restart**, di sisi lain, memiliki fungsi yang mirip tetapi bekerja dengan cara yang berbeda. Saat dilakukan hot restart, aplikasi akan menghapus seluruh state yang tersimpan dan memulai ulang dari kondisi awal seperti saat pertama kali dijalankan. Proses ini lebih lambat dibanding hot reload, tetapi tetap lebih cepat dibanding “full restart” (menjalankan ulang aplikasi sepenuhnya).

**Perbedaan utama:**
Hot reload mempertahankan state, sedangkan hot restart mengatur ulang state aplikasi ke kondisi awal. Hot reload cocok untuk perubahan kecil pada UI atau logika tampilan, sedangkan hot restart digunakan ketika perubahan kode memengaruhi struktur dasar aplikasi, seperti mengubah tipe data, menambahkan variabel global, atau memodifikasi kelas utama.

## **Daftar Pustaka**

Mhatre, D. (2025, May 9). *What is Flutter Widget Tree: A Comprehensive Guide.* F22 Labs. Diakses dari [https://www.f22labs.com/blogs/what-is-flutter-widget-tree-a-comprehensive-guide/](https://www.f22labs.com/blogs/what-is-flutter-widget-tree-a-comprehensive-guide/)

Flutter. *MaterialApp class.* Diakses dari [https://api.flutter.dev/flutter/material/MaterialApp-class.html](https://api.flutter.dev/flutter/material/MaterialApp-class.html)

Flutter. *Scaffold class.* Diakses dari [https://api.flutter.dev/flutter/material/Scaffold-class.html](https://api.flutter.dev/flutter/material/Scaffold-class.html)

Flutter. *AppBar class.* Diakses dari [https://api.flutter.dev/flutter/material/AppBar-class.html](https://api.flutter.dev/flutter/material/AppBar-class.html)

Flutter. *Padding class.* Diakses dari [https://api.flutter.dev/flutter/widgets/Padding-class.html](https://api.flutter.dev/flutter/widgets/Padding-class.html)

Flutter. *Container class.* Diakses dari [https://api.flutter.dev/flutter/widgets/Container-class.html](https://api.flutter.dev/flutter/widgets/Container-class.html)

Flutter. *SizedBox class.* Diakses dari [https://api.flutter.dev/flutter/widgets/SizedBox-class.html](https://api.flutter.dev/flutter/widgets/SizedBox-class.html)

Flutter. *Material class.* Diakses dari [https://api.flutter.dev/flutter/material/Material-class.html](https://api.flutter.dev/flutter/material/Material-class.html)

Flutter. *InkWell class.* Diakses dari [https://api.flutter.dev/flutter/material/InkWell-class.html](https://api.flutter.dev/flutter/material/InkWell-class.html)

NextGen. (t.t.). *Flutter MaterialApp.* Diakses dari [https://nextgen.co.id/flutter-materialapp/](https://nextgen.co.id/flutter-materialapp/)

Nash, R. (2022, January 13). *Why Every Flutter Dev Should Care About BuildContext.* GetStream. Diakses dari [https://getstream.io/blog/flutter-buildcontext/](https://getstream.io/blog/flutter-buildcontext/)

GeeksforGeeks. (2023, February 14). *Difference Between Hot Reload and Hot Restart in Flutter.* Diakses dari [https://www.geeksforgeeks.org/flutter/difference-between-hot-reload-and-hot-restart-in-flutter/](https://www.geeksforgeeks.org/flutter/difference-between-hot-reload-and-hot-restart-in-flutter/)


<div align="center">

# **TUGAS 8**

</div>

### 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

#### Perbandingan

| Aspek                           | Navigator.push()       | Navigator.pushReplacement()           |
| ------------------------------- | ---------------------- | ------------------------------------- |
| **Aksi pada Stack**             | Menambahkan route baru | Mengganti route paling atas           |
| **Akses ke Halaman Sebelumnya** | Bisa kembali (Back)    | Tidak bisa kembali                    |
| **Tujuan Penggunaan**           | Navigasi sementara     | Navigasi permanen antar halaman utama |

#### 1. Menggunakan Navigator.push()

**Contoh:**

```dart
if (item.name == "Create Product") {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProductFormPage()),
  );
}
```

**Alasan:**

* Pengguna perlu kembali ke halaman Home setelah membuka form.
* State halaman Home tetap terjaga.
* Navigasi bersifat sementara, misalnya ketika pengguna membatalkan pengisian form.

#### 2. Menggunakan Navigator.pushReplacement()

**Contoh:**

```dart
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Home'),
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  },
);
```

**Alasan:**

* Navigasi dari Drawer Menu ke halaman utama lain (misalnya Home atau Create Product).
* Tidak perlu menumpuk halaman lama di stack.
* Menghindari loop navigasi seperti Home → Form → Home → Form...
* Lebih efisien memori karena hanya satu halaman aktif di atas stack.

---

### 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Scaffold merupakan widget utama yang menyediakan kerangka dasar aplikasi Flutter berbasis Material Design.
Widget ini memperluas seluruh layar perangkat dan menjadi wadah bagi elemen-elemen seperti AppBar, Drawer, dan konten utama.
Dengan menggunakan Scaffold secara konsisten, setiap halaman aplikasi memiliki struktur layout yang seragam dan profesional.

AppBar adalah bagian atas halaman (toolbar) yang biasanya berisi judul dan tombol aksi umum.
Penggunaan AppBar yang konsisten (warna, ikon, elevasi) membantu menjaga identitas visual dan pengalaman pengguna yang selaras di seluruh halaman.

Drawer digunakan untuk navigasi global ke berbagai halaman atau fitur dalam aplikasi.
Biasanya ditampilkan dalam bentuk ikon tiga garis di sudut kiri atas (hamburger icon), yang saat diklik menampilkan menu navigasi ke rute lain.
Dengan Drawer, pengguna dapat berpindah antar layar dengan mudah, terutama pada aplikasi yang memiliki banyak halaman.

**Contoh Implementasi pada Football Collectibles:**

```dart
return Scaffold(
  // AppBar menampilkan judul halaman di bagian atas.
  appBar: AppBar(
    title: const Text(
      'Football Collectibles',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    // Warna latar belakang AppBar diambil dari tema utama aplikasi.
    backgroundColor: Theme.of(context).colorScheme.primary,
  ),
  drawer: LeftDrawer(),
  // Konten utama halaman ditempatkan di body.
);
```

Dengan menggunakan hierarki widget seperti Scaffold + AppBar + Drawer secara konsisten:

* Tampilan aplikasi menjadi terpadu dan familiar di setiap halaman.
* Kode lebih efisien, karena komponen seperti AppBar dan Drawer tidak perlu diulang di setiap halaman.
* Navigasi global dapat diakses dengan mudah dan stabil di seluruh aplikasi.

---

### 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

#### 1. Padding

Padding digunakan untuk memberikan ruang kosong di sekitar widget lain, sehingga tata letak terlihat lebih rapi dan nyaman.
Selain aspek estetika, padding juga berperan penting dalam meningkatkan keterbacaan dan interaksi pengguna pada form.

**Kelebihan:**

* Meningkatkan keterbacaan dan estetika (input field dan label tidak terlalu rapat).
* Membantu menjaga layout tetap responsif di berbagai ukuran layar.
* Membuat tampilan form lebih rapi dan mudah dipelihara.

**Contoh Implementasi:**

```dart
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Product Name",
      labelText: "Name",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Name tidak boleh kosong!";
      }
      if (value.length > 100) {
        return "Name tidak boleh lebih dari 100 karakter!";
      }
      return null;
    },
  ),
);
```

#### 2. SingleChildScrollView

SingleChildScrollView digunakan untuk mencegah overflow ketika isi form terlalu panjang atau saat keyboard muncul.
Widget ini memungkinkan halaman untuk di-scroll secara vertikal, menjaga aksesibilitas seluruh elemen form di berbagai ukuran layar.

**Kelebihan:**

* Menghindari error overflow saat konten melebihi tinggi layar.
* Memastikan form tetap dapat diakses penuh di layar kecil atau orientasi landscape.
* Memberikan pengalaman pengguna yang halus dan responsif saat melakukan pengisian form panjang.

**Contoh Implementasi:**

```dart
body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banyak field form di sini
      ],
    ),
  ),
),
```

#### 3. ListView

ListView digunakan untuk menampilkan daftar widget dalam jumlah banyak secara efisien.
Berbeda dengan Column, ListView hanya merender item yang terlihat di layar, sehingga lebih hemat memori dan performa lebih baik.

**Kelebihan:**

* Ideal untuk menu navigasi atau daftar elemen yang panjang.
* Efisien dalam performa, karena hanya me-render item yang terlihat.
* Cocok digunakan di dalam Drawer atau halaman dengan banyak item berulang.

**Contoh Implementasi:**

```dart
Drawer(
  child: ListView(
    children: [
      DrawerHeader(
        decoration: const BoxDecoration(color: Colors.blue),
        child: const Column(
          children: [
            Text(
              'Football Collectibles',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Text(
              "Seluruh koleksi barang sepak bola terkini di sini!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Home'),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.add),
        title: const Text('Create Product'),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProductFormPage()),
          );
        },
      ),
    ],
  ),
);
```

---

### 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Theming adalah proses menetapkan sekumpulan warna, font, bentuk, dan gaya desain yang digunakan secara konsisten di seluruh aplikasi.
Tujuannya agar aplikasi memiliki identitas visual yang seragam, mudah dikenali, serta menjaga kode tetap rapi dan efisien.
Alih-alih menambahkan gaya secara terpisah di tiap widget, pengembang sebaiknya mendefinisikan gaya di satu tempat agar mudah dikelola dan tidak berulang (DRY – Don’t Repeat Yourself).

Dalam Flutter, objek ThemeData digunakan untuk mengatur tampilan dan perilaku aplikasi.
Properti colorScheme di dalamnya menyimpan hingga 27 properti warna yang digunakan oleh komponen bawaan Flutter dengan pola tertentu.

**Implementasi Tema pada Football Collectibles:**

```dart
import 'package:flutter/material.dart';
import 'package:football_collectibles/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Collectibles',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo, // ← BRAND COLOR: Deep Blue / Indigo
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

**Penjelasan:**

* ColorScheme.fromSeed() digunakan untuk menghasilkan palet warna lengkap berdasarkan satu warna utama (seed color).
* Warna utama yang digunakan adalah Indigo, melambangkan kepercayaan, profesionalitas, dan energi kompetitif, sesuai citra brand Football Shop.
* Penggunaan useMaterial3: true memastikan desain modern mengikuti panduan Material Design 3.

### **Daftar Pustaka**

1. Valentino Kim Fernando (SOY), Clarence Grady (GRD), Malvin Scafi (UMA), & Danniel (DAN). *Tutorial 7: Flutter Navigation, Layouts, Forms, and Input Elements.*
   [https://pbp-fasilkom-ui.github.io/ganjil-2026/docs/tutorial-7](https://pbp-fasilkom-ui.github.io/ganjil-2026/docs/tutorial-7)

2. *Flutter Scaffold.* Nextgen.co.id.
   [https://nextgen.co.id/flutter-scaffold/](https://nextgen.co.id/flutter-scaffold/)

3. *Flutter AppBar.* Nextgen.co.id.
   [https://nextgen.co.id/flutter-appbar/](https://nextgen.co.id/flutter-appbar/)

4. *Flutter Drawer.* Nextgen.co.id.
   [https://nextgen.co.id/flutter-drawer/](https://nextgen.co.id/flutter-drawer/)

5. Muhammad Caesar Saputra. *Memahami Penggunaan Widget Padding untuk Tata Letak yang Lebih Baik di Flutter.* BuildWithAngga, 2 Mei 2024.
   [https://buildwithangga.com/tips/memahami-penggunaan-widget-padding-untuk-tata-letak-yang-lebih-baik-di-flutter](https://buildwithangga.com/tips/memahami-penggunaan-widget-padding-untuk-tata-letak-yang-lebih-baik-di-flutter)

6. Snehal Singh. *How To Implement Flutter Scrollable Column: A Comprehensive Guide.* DhiWise, 26 April 2024.
   [https://www.dhiwise.com/post/how-to-implement-flutter-scrollable-column](https://www.dhiwise.com/post/how-to-implement-flutter-scrollable-column)

7. Jitesh Mohite. *Flutter Problem: ListView Vs Column + SingleChildScrollView.* Medium, 13 Juni 2020.
   [https://medium.com/flutterworld/flutter-problem-listview-vs-column-singlechildscrollview-43fdde0fa355](https://medium.com/flutterworld/flutter-problem-listview-vs-column-singlechildscrollview-43fdde0fa355)

8. *Theming a Flutter App: Getting Started.* Kodeco, 29 Desember 2020.
   [https://www.kodeco.com/16628777-theming-a-flutter-app-getting-started](https://www.kodeco.com/16628777-theming-a-flutter-app-getting-started)

9. RydMike. *Flutter Theming Guide.* 1–4 Mei 2022.
   [https://rydmike.com/blog_theming_guide.html](https://rydmike.com/blog_theming_guide.html)

# **TUGAS 9**


## 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Model Dart digunakan agar data yang diterima atau dikirim memiliki struktur dan tipe yang jelas. Dengan model, setiap field sudah didefinisikan tipenya sehingga kesalahan dapat terdeteksi lebih awal melalui type safety. Jika hanya menggunakan Map<String, dynamic>, kesalahan tipe baru terlihat saat runtime.

Model juga mendukung null-safety. Field dapat ditandai sebagai nullable atau wajib sehingga proses parsing lebih aman. Tanpa model, pengecekan null harus dilakukan secara manual di banyak tempat.

Dari sisi maintainability, model membuat struktur data lebih jelas dan terpusat. Ketika API berubah, cukup memperbarui model tanpa harus mengubah seluruh bagian kode yang menggunakan map.

Pada proses serialisasi dan deserialisasi, penggunaan json_serializable menghasilkan kode yang lebih konsisten dan diperiksa saat compile-time. Tanpa model, parsing menggunakan map sering kali duplikatif dan kurang terstruktur.

**Konsekuensi jika hanya menggunakan Map<String, dynamic>:**

* Kesalahan tipe muncul di runtime.
* Risiko null pointer lebih besar.
* Struktur data tidak terpusat sehingga sulit direfaktor.
* Autocomplete dan analisis statis terbatas.
* Kode parsing cenderung tersebar dan sulit dipelihara.


## 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Package **http** menyediakan antarmuka untuk melakukan permintaan HTTP seperti GET dan POST. Package ini tidak mengelola sesi atau cookie sehingga autentikasi harus diatur manual.

Contoh login menggunakan http:

```dart
var response = await http.post(
  Uri.parse('http://localhost:8000/api/login/'),
  body: {'username': username, 'password': password},
);
```

**CookieRequest** dirancang untuk memakai autentikasi berbasis sesi. CookieRequest menyimpan dan mengirim session cookie serta menangani token CSRF secara otomatis.

Contoh login menggunakan CookieRequest:

```dart
var response = await request.post(
  'http://localhost:8000/api/login/',
  {'username': username, 'password': password},
);
```

**Perbedaan peran:**

* http: tidak mengelola cookie dan tidak mempertahankan sesi.
* CookieRequest: mengelola session cookie dan CSRF otomatis serta mempertahankan status autentikasi.


## 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance CookieRequest harus disediakan dari root widget menggunakan Provider agar seluruh komponen menggunakan instance yang sama.

Alasannya:

* Sesi konsisten karena cookie dan token tersimpan pada satu instance.
* Semua widget dapat mengakses CookieRequest tanpa membuat instance baru.
* Kode lebih bersih dan tidak perlu penanganan cookie secara manual.


## 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

1. **ALLOWED_HOSTS**

   Django hanya menerima permintaan dari host yang terdaftar. Emulator Android menggunakan alamat 10.0.2.2 untuk mengakses komputer host sehingga alamat tersebut perlu ditambahkan. Jika tidak, permintaan akan ditolak oleh Django.

2. **CORS**

   Ketika menggunakan Flutter Web, akses ke Django dianggap sebagai cross-origin. CORS harus diaktifkan agar browser mengizinkan permintaan. Jika tidak, browser memblokir permintaan sebelum mencapai backend.

3. **Pengaturan Cookie (SameSite, Secure, Credentials)**

   Autentikasi sesi memerlukan pengaturan cookie agar cookie dapat dikirim lintas origin. Jika konfigurasi salah, cookie tidak terkirim dan proses login gagal.

4. **Izin Akses Internet Android**

   Android memerlukan izin khusus agar aplikasi dapat mengakses internet. Jika izin tidak ada, semua permintaan dari Flutter gagal.


## 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

1. Pengguna mengisi input melalui widget seperti TextField, Dropdown, atau Checkbox. Nilainya disimpan dalam state variable.
2. Flutter melakukan validasi sisi klien.
3. Data diserialisasi menjadi JSON atau Map<String, dynamic>.
4. Flutter mengirim permintaan ke Django menggunakan CookieRequest atau http.
5. Django menerima permintaan, memvalidasi data, menyimpan ke database, dan mengirim respons JSON.
6. Flutter menerima respons dan memetakannya ke model.
7. Flutter menampilkan data menggunakan widget seperti ListView atau halaman detail.

Ringkasan:
Input → Validasi Flutter → JSON → Permintaan ke Django → Pemrosesan → Respons JSON → Pemetaan ke model → Tampilan.


## 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

**Register**
Flutter mengirim username dan password ke endpoint register. Django memvalidasi data, meng-hash password, menyimpan user, dan mengirim respons.

**Login**
Flutter mengirim username dan password ke Django. Django memverifikasi keduanya, membuat sessionid, dan menyimpannya. CookieRequest menyimpan sessionid sehingga Flutter dapat menampilkan MenuPage.

**Akses setelah login**
CookieRequest mengirim sessionid dan token CSRF secara otomatis pada setiap permintaan. Django membaca session, mengidentifikasi user, dan mengirimkan data sesuai hak akses.

**Logout**
Flutter mengirim permintaan logout. Django menghapus session dan cookie. CookieRequest menghapus session lokal dan Flutter kembali ke halaman login.


## 7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!

**a. Registrasi akun (Django + Flutter)**

Flutter membuat halaman Register menggunakan Form dan TextFormField. Saat tombol submit ditekan, aplikasi mengirim POST ke `http://localhost:8000/register/` menggunakan package request yang menyimpan cookie session. Setelah itu ditampilkan SnackBar untuk menampilkan pesan sukses atau error.

**b. Halaman login Flutter**

Flutter menyediakan form berisi username dan password. Ketika submit, aplikasi mengirim POST ke `http://localhost:8000/auth/login/`. Jika respons 200 dan status success, aplikasi menyimpan flag logged-in dan username dari respons ke state melalui Provider atau CookieRequest. Setelah login berhasil, navigasi dialihkan ke halaman menu utama.

**c. Integrasi autentikasi Django**

Pada Django, view `login_user` menggunakan `authenticate()` dan `login(request, user)` lalu mengembalikan JSON berisi status, message, dan username. View `logout_user` memanggil `logout(request)` dan mengembalikan JSON. Karena Flutter bukan browser dan tidak mengirim CSRF token, endpoint diberi dekorator `@csrf_exempt`. Untuk konfigurasi CORS, ditambahkan `corsheaders` ke INSTALLED_APPS, CorsMiddleware ditempatkan di urutan teratas MIDDLEWARE, dan diatur `CORS_ALLOW_ALL_ORIGINS = True` atau whitelist. ALLOWED_HOSTS diisi dengan `"localhost"`, `"127.0.0.1"`, dan `"10.0.2.2"`.

**d. Endpoint JSON daftar semua item**

Pada Django dibuat view `get_products_json` yang mengambil seluruh `Product.objects.all()`, melakukan serialisasi manual ke list dictionary (termasuk konversi UUID ke string), kemudian mengembalikan JsonResponse dengan `safe=False`. Endpoint dipetakan melalui route `api/products/`.

**e. Menampilkan name, price, description, thumbnail, category, is_featured**

Flutter membuat model Dart `Product` sesuai struktur JSON. Data diambil dengan `http.get(Uri.parse('http://localhost:8000/api/products/'))`, kemudian di-decode dan dimapping ke list Product. UI menggunakan ListView.builder untuk menampilkan setiap item lengkap dengan thumbnail, name, price, description singkat, category, dan is_featured.

**f. Halaman detail item**

Ketika pengguna menekan salah satu card item di daftar, Flutter menavigasi ke `ProductDetailPage(product: selectedProduct)`. Halaman detail menampilkan seluruh atribut, meliputi name, price, description lengkap, category, stock, brand, release_year, size, edition_type, condition, authenticity_certificate, rarity_level, dan is_featured. Tombol kembali menggunakan `Navigator.pop(context)`.

**g. Tombol kembali ke daftar**

Kembali ke daftar dapat dilakukan menggunakan back arrow default pada AppBar atau ElevatedButton yang memanggil `Navigator.pop()`.

**h. Filter hanya item milik user login (“My Products”)**

Django menyediakan view `get_user_products_json` yang memeriksa `request.user.is_authenticated` lalu mengambil produk menggunakan `Product.objects.filter(user=request.user)`. View ini terhubung pada route `api/products/user/`. Di Flutter, tombol “My Products” memicu fetch ke endpoint ini. Jika respons 401, aplikasi menampilkan SnackBar “Not authenticated”. Tampilan list sama seperti “All Products” namun berisi data hasil filter.

**i. Endpoint create product (form Flutter)**

Flutter membuat form dengan validasi untuk setiap field. Saat submit, aplikasi mengirim POST ke `/api/products/create/`. Jika respons sukses (201), Flutter menampilkan SnackBar hijau dan kembali ke halaman sebelumnya atau melakukan refresh list.

**j. Menjaga session agar request berautentikasi**

Autentikasi dijaga dengan menggunakan kelas helper CookieRequest yang menyimpan cookie dari login. Cookie tersebut kemudian otomatis dikirim pada setiap request berikutnya. Semua endpoint seperti “My Products” dan create product diakses menggunakan instance request yang sama agar session tetap valid.


## Daftar Referensi

Vibe Studio. (2025, August 13). *Handling large JSON data efficiently with json_serializable and isolates in Flutter*. [https://vibe-studio.ai/insights/handling-large-json-data-efficiently-with-json-serializable-and-isolates-in-flutter](https://vibe-studio.ai/insights/handling-large-json-data-efficiently-with-json-serializable-and-isolates-in-flutter)

Kärkkäinen, I. (2018, February 8). *JSON and serialization in Flutter*. [https://iiro.dev/json-and-serializationiiro.dev](https://iiro.dev/json-and-serializationiiro.dev)

FlutterHolic. (2023, April 7). *HTTP package*. [https://flutterholic.com/http-package/](https://flutterholic.com/http-package/)

pub.dev. (n.d.). *pbp_django_auth*. [https://pub.dev/documentation/pbp_django_auth/latest/](https://pub.dev/documentation/pbp_django_auth/latest/)

Fakultas Ilmu Komputer Universitas Indonesia. (2025). *Tutorial 8: Flutter networking, authentication, and integration*. Pemrograman Berbasis Platform (CSGE602022). [https://pbp-fasilkom-ui.github.io/ganjil-2026/docs/tutorial-8](https://pbp-fasilkom-ui.github.io/ganjil-2026/docs/tutorial-8)

Android Developers. (n.d.). *Menyiapkan jaringan Android Emulator*. [https://developer.android.com/studio/run/emulator-networking?hl=id](https://developer.android.com/studio/run/emulator-networking?hl=id)

Django Software Foundation. (n.d.). *ALLOWED_HOSTS*. [https://docs.djangoproject.com/en/5.0/ref/settings/#allowed-hosts](https://docs.djangoproject.com/en/5.0/ref/settings/#allowed-hosts)

Mozilla Developer Network. (n.d.). *Cross-Origin Resource Sharing (CORS)*. [https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CORS)
