import 'package:flutter/material.dart';
import 'package:football_collectibles/models/product_entry.dart';
import 'package:football_collectibles/screens/product_detail.dart';
import 'package:football_collectibles/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryList extends StatefulWidget {
  final bool filterByUser;

  const ProductEntryList({super.key, this.filterByUser = false});

  @override
  State<ProductEntryList> createState() => _ProductEntryListState();
}

class _ProductEntryListState extends State<ProductEntryList> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    // Tentukan endpoint berdasarkan filter
    String endpoint = widget.filterByUser
        ? 'http://localhost:8000/api/products/user/'
        : 'http://localhost:8000/api/products/';

    String pageTitle = widget.filterByUser
        ? 'Produk Saya'
        : 'Daftar Semua Produk';

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: FutureBuilder(
        future: request.get(endpoint),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return Center(
              child: Text(
                widget.filterByUser
                    ? 'Anda belum membuat produk.'
                    : 'Tidak ada data produk.',
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Parse the response
            List<ProductEntry> listProduct = [];

            // Handle jika response adalah list atau object dengan data key
            var data = snapshot.data;
            if (data is List) {
              for (var d in data) {
                if (d != null) {
                  listProduct.add(ProductEntry.fromJson(d));
                }
              }
            } else if (data is Map && data.containsKey('data')) {
              // Jika response format: { "data": [...] }
              for (var d in data['data']) {
                if (d != null) {
                  listProduct.add(ProductEntry.fromJson(d));
                }
              }
            }

            if (listProduct.isEmpty) {
              return Center(
                child: Text(
                  widget.filterByUser
                      ? 'Anda belum membuat produk.'
                      : 'Tidak ada produk yang tersedia.',
                ),
              );
            }

            return ListView.builder(
              itemCount: listProduct.length,
              itemBuilder: (_, index) {
                return _buildProductCard(context, listProduct[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, ProductEntry product) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductEntryDetailPage(product: product),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            if (product.thumbnail.isNotEmpty)
              Image.network(
                product.thumbnail,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.broken_image, size: 50),
                    ),
                  );
                },
              )
            else
              Container(
                height: 200,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image_not_supported, size: 50),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured Badge
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Featured',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  if (product.isFeatured) const SizedBox(height: 8),

                  // Product Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Price
                  Text(
                    'Rp ${product.price}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Description
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Category and Stock
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          product.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Stok: ${product.stock}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
