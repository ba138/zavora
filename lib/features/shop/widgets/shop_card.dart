import 'package:flutter/material.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';
import 'package:zavora/model/productItem_model.dart';

class ShopCard extends StatelessWidget {
  final ProductItem product;

  const ShopCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                product.image,
                width: 86,
                height: 86,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: product.title,
                    size: 16,
                    weight: FontWeight.bold,
                    color: AppColors.background,
                  ),
                  const SizedBox(height: 6),
                  MyText(
                    text: product.subtitle,
                    size: 13,
                    color: AppColors.background.withValues(alpha: 0.7),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyText(
                  text: "\$${product.price}",
                  size: 16,
                  weight: FontWeight.bold,
                  color: AppColors.background,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
