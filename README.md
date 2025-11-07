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