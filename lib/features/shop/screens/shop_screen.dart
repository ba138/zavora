import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';
import 'package:zavora/contants/my_button.dart';
import 'package:zavora/features/home/providers/home_provider.dart';
import 'package:zavora/features/shop/widgets/shop_card.dart';

class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen({super.key});

  @override
  ConsumerState<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends ConsumerState<ShopScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
