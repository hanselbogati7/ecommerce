import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class _BannerData {
  final String title;
  final String subtitle;
  final String image;
  final String category; // where the banner leads ('All' = every product)

  const _BannerData(this.title, this.subtitle, this.image, this.category);
}

const _banners = [
  _BannerData('Summer Sale', 'Up to 40% off fashion',
      'https://picsum.photos/seed/summersale/1000/400', 'Fashion'),
  _BannerData('New Arrivals', 'Fresh picks just landed',
      'https://picsum.photos/seed/newarrivals/1000/400', 'All'),
  _BannerData('Electronics Discount', 'Best deals on gadgets',
      'https://picsum.photos/seed/electronicsdeal/1000/400', 'Electronics'),
];

/// Promotional banner slider built with the carousel_slider package.
class BannerCarousel extends StatefulWidget {
  final void Function(String category) onBannerTap;

  const BannerCarousel({super.key, required this.onBannerTap});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _current = 0;

  Widget _buildBanner(_BannerData b) {
    return GestureDetector(
      onTap: () => widget.onBannerTap(b.category),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              b.image,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => Container(color: Colors.indigo.shade200),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    b.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(b.subtitle,
                      style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Shop now',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 170,
            viewportFraction: 0.92,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => setState(() => _current = index),
          ),
          items: _banners.map(_buildBanner).toList(),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_banners.length, (i) {
            final active = i == _current;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 18 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: active ? scheme.primary : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}