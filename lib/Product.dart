class Product {
  final String name;
  final String category;
  final String image;
  final double price;
  final double rating;
  final String description;
  final int discountPercent; // 0 = no sale badge
  final bool isNew;

  const Product({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    this.discountPercent = 0,
    this.isNew = false,
  });

  String get priceLabel => 'Rs. ${price.toStringAsFixed(0)}';
}