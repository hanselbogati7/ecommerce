import 'package:flutter/material.dart';

/// Shows a network image (http...) or a local asset image, with
/// loading and error states. Fills the space given by its parent.
class ProductImage extends StatelessWidget {
  final String image;
  final BoxFit fit;

  const ProductImage({super.key, required this.image, this.fit = BoxFit.cover});

  Widget _placeholder() => Container(
    color: Colors.grey.shade200,
    child: const Center(
      child: Icon(Icons.image_not_supported_outlined, color: Colors.grey),
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (image.startsWith('http')) {
      return Image.network(
        image,
        fit: fit,
        loadingBuilder: (context, child, progress) => progress == null
            ? child
            : Container(
          color: Colors.grey.shade200,
          child: const Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
        errorBuilder: (context, error, stack) => _placeholder(),
      );
    }
    return Image.asset(
      image,
      fit: fit,
      errorBuilder: (context, error, stack) => _placeholder(),
    );
  }
}