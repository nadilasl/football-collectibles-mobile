import 'package:flutter/material.dart';
import 'package:football_collectibles/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "jersey"; // default
  bool _isFeatured = false;
  int _stock = 0;
  String _brand = "";
  int? _releaseYear;
  String _size = "";
  String _editionType = "replica";
  String _condition = "new";
  bool _authenticityCertificate = false;
  String _rarityLevel = "common";

  final List<Map<String, String>> _categories = [
    {'value': 'jersey', 'label': 'Jersey'},
    {'value': 'scarves_banner', 'label': 'Scarves or Banners'},
    {'value': 'footballs', 'label': 'Collector Footballs'},
    {'value': 'autographed', 'label': 'Autographed Memorabilia'},
    {'value': 'second_hand', 'label': 'Second-Hand Collectible'},
    {'value': 'limited_edition', 'label': 'Limited Edition Item'},
    {'value': 'authentic_retail', 'label': 'Authentic Retail Jersey'},
    {'value': 'replica_jersey', 'label': 'Replica Jersey'},
    {'value': 'match_worn', 'label': 'Match-Worn Jersey'},
  ];

  final List<Map<String, String>> _sizes = [
    {'value': 's', 'label': 'S'},
    {'value': 'm', 'label': 'M'},
    {'value': 'l', 'label': 'L'},
    {'value': 'xl', 'label': 'XL'},
    {'value': 'xxl', 'label': 'XXL'},
  ];

  final List<Map<String, String>> _editionTypes = [
    {'value': 'replica', 'label': 'Replica'},
    {'value': 'limited', 'label': 'Limited Edition'},
    {'value': 'secondhand', 'label': 'Second Hand'},
  ];

  final List<Map<String, String>> _conditions = [
    {'value': 'new', 'label': 'New'},
    {'value': 'like_new', 'label': 'Like New'},
    {'value': 'good', 'label': 'Good'},
  ];

  final List<Map<String, String>> _rarityLevels = [
    {'value': 'common', 'label': 'Common'},
    {'value': 'rare', 'label': 'Rare'},
    {'value': 'legendary', 'label': 'Legendary'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Form Tambah Barang')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Name (Product Name) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    if (value.length > 100) {
                      return "Nama produk maksimal 100 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Price ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga",
                    labelText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    if (int.parse(value) < 0) {
                      return "Harga tidak boleh negatif!";
                    }
                    return null;
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Produk",
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "URL Thumbnail tidak boleh kosong!";
                    }
                    // Validasi format URL
                    final urlPattern = RegExp(
                      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
                    );
                    if (!urlPattern.hasMatch(value)) {
                      return "Format URL tidak valid!";
                    }
                    return null;
                  },
                ),
              ),

              // === Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map(
                        (cat) => DropdownMenuItem(
                          value: cat['value'],
                          child: Text(cat['label']!),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              // === Stock ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Stok",
                    labelText: "Stok",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _stock = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Stok tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Stok harus berupa angka!";
                    }
                    if (int.parse(value) < 0) {
                      return "Stok tidak boleh negatif!";
                    }
                    return null;
                  },
                ),
              ),

              // === Brand (Optional) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Brand (opsional)",
                    labelText: "Brand",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _brand = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value != null && value.length > 50) {
                      return "Brand maksimal 50 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Release Year (Optional) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Tahun Rilis (opsional)",
                    labelText: "Tahun Rilis",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _releaseYear = int.tryParse(value ?? "");
                    });
                  },
                  validator: (String? value) {
                    if (value != null && value.isNotEmpty) {
                      if (int.tryParse(value) == null) {
                        return "Tahun rilis harus berupa angka!";
                      }
                      int year = int.parse(value);
                      if (year < 1900 || year > DateTime.now().year) {
                        return "Tahun rilis tidak valid!";
                      }
                    }
                    return null;
                  },
                ),
              ),

              // === Size (Optional) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Ukuran (opsional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _size.isEmpty ? null : _size,
                  items: _sizes
                      .map(
                        (size) => DropdownMenuItem(
                          value: size['value'],
                          child: Text(size['label']!),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _size = newValue ?? "";
                    });
                  },
                ),
              ),

              // === Edition Type ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Tipe Edisi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _editionType,
                  items: _editionTypes
                      .map(
                        (type) => DropdownMenuItem(
                          value: type['value'],
                          child: Text(type['label']!),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _editionType = newValue!;
                    });
                  },
                ),
              ),

              // === Condition ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kondisi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _condition,
                  items: _conditions
                      .map(
                        (cond) => DropdownMenuItem(
                          value: cond['value'],
                          child: Text(cond['label']!),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _condition = newValue!;
                    });
                  },
                ),
              ),

              // === Rarity Level ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Tingkat Kelangkaan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _rarityLevel,
                  items: _rarityLevels
                      .map(
                        (rarity) => DropdownMenuItem(
                          value: rarity['value'],
                          child: Text(rarity['label']!),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _rarityLevel = newValue!;
                    });
                  },
                ),
              ),

              // === Is Featured ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Produk Unggulan"),
                  value: _isFeatured,
                  onChanged: (bool value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
              ),

              // === Authenticity Certificate ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Sertifikat Keaslian"),
                  value: _authenticityCertificate,
                  onChanged: (bool value) {
                    setState(() {
                      _authenticityCertificate = value;
                    });
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil disimpan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Harga: Rp $_price'),
                                    Text('Deskripsi: $_description'),
                                    Text('Thumbnail: $_thumbnail'),
                                    Text('Kategori: $_category'),
                                    Text('Stok: $_stock'),
                                    Text('Brand: $_brand'),
                                    Text('Tahun Rilis: ${_releaseYear ?? "-"}'),
                                    Text(
                                      'Ukuran: ${_size.isEmpty ? "-" : _size}',
                                    ),
                                    Text('Tipe Edisi: $_editionType'),
                                    Text('Kondisi: $_condition'),
                                    Text('Kelangkaan: $_rarityLevel'),
                                    Text(
                                      'Unggulan: ${_isFeatured ? "Ya" : "Tidak"}',
                                    ),
                                    Text(
                                      'Sertifikat: ${_authenticityCertificate ? "Ya" : "Tidak"}',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _name = "";
                                      _price = 0;
                                      _description = "";
                                      _thumbnail = "";
                                      _category = "jersey";
                                      _stock = 0;
                                      _brand = "";
                                      _releaseYear = null;
                                      _size = "";
                                      _editionType = "replica";
                                      _condition = "new";
                                      _isFeatured = false;
                                      _authenticityCertificate = false;
                                      _rarityLevel = "common";
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
