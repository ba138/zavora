import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';
import 'package:zavora/contants/my_button.dart';
import 'package:zavora/features/home/providers/home_provider.dart';
import 'package:zavora/features/shop/widgets/shop_card.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(homeProductsProvider);

    final count = math.min(6, products.length);

    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  MyText(
                    text: "My Order",
                    color: AppColors.background,
                    size: 20,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: MyBorderButton(
                      buttonText: "ongoing",
                      onTap: () {},
                      bgColor: Colors.transparent,
                      textColor: AppColors.background,
                      borderColor: AppColors.background,
                      radius: 8,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: MyButton(
                      buttonText: "Complete",
                      onTap: () {},
                      radius: 8,
                      height: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: count,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = products[index];
                    return ShopCard(product: item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
