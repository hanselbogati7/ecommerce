import 'package:flutter/material.dart';

import 'banner_carousel.dart';
import 'category_item.dart';
import 'category_page.dart';
import 'product_card.dart';
import 'product_data.dart';
import 'product_details_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openCategory(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(categoryName: name),
      ),
    );
  }

  void _openProduct(BuildContext context, product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(product: product),
      ),
    );
  }

  void _showMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  Widget _sectionHeader(String title, {VoidCallback? onSeeAll}) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 20, 8, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style:
            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        if (onSeeAll != null)
          TextButton(onPressed: onSeeAll, child: const Text('See All →')),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final popular = products.take(8).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.shopping_bag,
                color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            const Text('MyShop',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showMessage(context, 'Search coming soon'),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => _showMessage(context, 'Your cart is empty'),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            BannerCarousel(
              onBannerTap: (category) => _openCategory(context, category),
            ),
            _sectionHeader('Categories'),
            // Horizontal scrolling category list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: categories
                    .map((c) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CategoryItem(
                    category: c,
                    onTap: () => _openCategory(context, c.name),
                  ),
                ))
                    .toList(),
              ),
            ),
            _sectionHeader(
              'Popular Products',
              onSeeAll: () => _openCategory(context, 'All'),
            ),
            SizedBox(
              height: 280,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: popular.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) => SizedBox(
                  width: 170,
                  child: ProductCard(
                    product: popular[index],
                    onViewDetails: () => _openProduct(context, popular[index]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}