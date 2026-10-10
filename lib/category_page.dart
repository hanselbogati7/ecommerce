import 'package:flutter/material.dart';

import 'product_card.dart';
import 'product_data.dart';
import 'product_details_page.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final items = productsByCategory(categoryName);
    final title = categoryName == 'All' ? 'All Products' : categoryName;

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: items.isEmpty
          ? const Center(child: Text('No products in this category yet.'))
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.62,
        ),
        itemBuilder: (context, index) {
          final product = items[index];
          return ProductCard(
            product: product,
            onViewDetails: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsPage(product: product),
              ),
            ),
          );
        },
      ),
    );
  }
}