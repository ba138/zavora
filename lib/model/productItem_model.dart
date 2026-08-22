import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zavora/generated/assets.dart';

class ProductItem {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final bool isFavorite;

  const ProductItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    this.isFavorite = false,
  });
}
