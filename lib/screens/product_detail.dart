import 'package:flutter/material.dart';
import 'package:football_collectibles/models/product_entry.dart';

class ProductEntryDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductEntryDetailPage({super.key, required this.product});

  String _getConditionLabel(String condition) {
    final conditions = {
      'new': 'Baru',
      'like_new': 'Seperti Baru',
      'good': 'Bagus',
    };
    return conditions[condition] ?? condition;
  }

  String _getEditionTypeLabel(String editionType) {
    final types = {
      'replica': 'Replika',
      'limited': 'Limited Edition',
      'secondhand': 'Second Hand',
    };
    return types[editionType] ?? editionType;
  }

  String _getRarityLabel(String rarity) {
    final rarities = {
      'common': 'Umum',
      'rare': 'Langka',
      'legendary': 'Legendaris',
    };
    return rarities[rarity] ?? rarity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail Image
            if (product.thumbnail.isNotEmpty)
              Image.network(
                product.thumbnail,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 300,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 80),
                  ),
                ),
              )
            else
              Container(
                height: 300,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image_not_supported, size: 80),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured Badge
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6.0,
                      ),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        'Featured',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),

                  // Product Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Price
                  Text(
                    'Rp ${product.price}',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Category & Rarity Badges
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          product.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          _getRarityLabel(product.rarityLevel),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 32),

                  // Description
                  _buildDetailSection('Deskripsi', product.description),
                  const SizedBox(height: 16),

                  // Stock Information
                  _buildDetailRow('Stok', '${product.stock} unit'),
                  const SizedBox(height: 12),

                  // Brand
                  if (product.brand.isNotEmpty)
                    _buildDetailRow('Brand', product.brand),
                  if (product.brand.isNotEmpty) const SizedBox(height: 12),

                  // Edition Type
                  _buildDetailRow(
                    'Tipe Edisi',
                    _getEditionTypeLabel(product.editionType),
                  ),
                  const SizedBox(height: 12),

                  // Condition
                  _buildDetailRow(
                    'Kondisi',
                    _getConditionLabel(product.condition),
                  ),
                  const SizedBox(height: 12),

                  // Size
                  if (product.size.isNotEmpty)
                    _buildDetailRow('Ukuran', product.size.toUpperCase()),
                  if (product.size.isNotEmpty) const SizedBox(height: 12),

                  // Release Year
                  if (product.releaseYear != null)
                    _buildDetailRow('Tahun Rilis', '${product.releaseYear}'),
                  if (product.releaseYear != null) const SizedBox(height: 12),

                  // Authenticity Certificate
                  _buildDetailRow(
                    'Sertifikat Keaslian',
                    product.authenticityCertificate ? 'Ya' : 'Tidak',
                  ),

                  const SizedBox(height: 32),

                  // Back Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Kembali ke Daftar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
