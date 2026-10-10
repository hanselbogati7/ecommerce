import 'package:flutter/material.dart';

import 'product.dart';
import 'shop_category.dart';



final List<ShopCategory> categories = [
  ShopCategory(name: 'Electronics', icon: Icons.devices),
  ShopCategory(name: 'Fashion', icon: Icons.checkroom),
  ShopCategory(name: 'Shoes', icon: Icons.directions_run),
  ShopCategory(name: 'Beauty', icon: Icons.face),
  ShopCategory(name: 'Accessories', icon: Icons.watch),
];

final List<Product> products = [
  Product(
    name: 'Wireless Headphones',
    category: 'Electronics',
    image: 'https://picsum.photos/seed/headphones/600/600',
    price: 3500,
    rating: 4.5,
    description: 'Wireless headphones with high-quality sound.',
    discountPercent: 20,
  ),
  Product(
    name: 'Smart Watch',
    category: 'Electronics',
    image: 'https://picsum.photos/seed/smartwatch/600/600',
    price: 7999,
    rating: 4.3,
    description: 'Smart watch with heart-rate tracking and notifications.',
    isNew: true,
  ),
  Product(
    name: 'Laptop',
    category: 'Electronics',
    image: 'https://picsum.photos/seed/laptop/600/600',
    price: 89999,
    rating: 4.7,
    description: 'Lightweight laptop with 16 GB RAM and 512 GB SSD.',
  ),
  Product(
    name: 'T-Shirt',
    category: 'Fashion',
    image: 'https://picsum.photos/seed/tshirt/600/600',
    price: 999,
    rating: 4.2,
    description: 'Soft cotton T-shirt with a relaxed fit.',
    discountPercent: 15,
  ),
  Product(
    name: 'Denim Jacket',
    category: 'Fashion',
    image: 'https://picsum.photos/seed/jacket/600/600',
    price: 3499,
    rating: 4.4,
    description: 'Classic denim jacket for everyday wear.',
  ),
  Product(
    name: 'Sneakers',
    category: 'Shoes',
    image: 'https://picsum.photos/seed/sneakers/600/600',
    price: 4599,
    rating: 4.6,
    description: 'Comfortable running sneakers with a grippy sole.',
    isNew: true,
  ),
  Product(
    name: 'Leather Boots',
    category: 'Shoes',
    image: 'https://picsum.photos/seed/boots/600/600',
    price: 6299,
    rating: 4.1,
    description: 'Durable leather boots with a comfortable insole.',
  ),
  Product(
    name: 'Face Cream',
    category: 'Beauty',
    image: 'https://picsum.photos/seed/cream/600/600',
    price: 850,
    rating: 4.3,
    description: 'Daily moisturizer suitable for all skin types.',
  ),
  Product(
    name: 'Sunglasses',
    category: 'Accessories',
    image: 'https://picsum.photos/seed/sunglasses/600/600',
    price: 1299,
    rating: 4.0,
    description: 'UV400 protection sunglasses with a light frame.',
  ),
  Product(
    name: 'Backpack',
    category: 'Accessories',
    image: 'https://picsum.photos/seed/backpack/600/600',
    price: 2799,
    rating: 4.6,
    description: 'Water-resistant backpack with a laptop compartment.',
    isNew: true,
  ),
];

List<Product> productsByCategory(String category) {
  if (category == 'All') return products;
  return products.where((p) => p.category == category).toList();
}