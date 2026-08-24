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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Animation<double> _fadeAnimation(int index) {
    final start = (index * 0.15).clamp(0.0, 0.7);
    final end = (start + 0.3).clamp(0.0, 1.0);

    return CurvedAnimation(
      parent: _controller,
      curve: Interval(start, end, curve: Curves.easeOut),
    );
  }

  Animation<Offset> _slideAnimation(int index) {
    final start = (index * 0.15).clamp(0.0, 0.7);
    final end = (start + 0.3).clamp(0.0, 1.0);

    return Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ),
    );
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
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: count,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = products[index];
                    final notifier = ref.read(homeProductsProvider.notifier);
                    return FadeTransition(
                      opacity: _fadeAnimation(index),
                      child: SlideTransition(
                        position: _slideAnimation(index),
                        child: Dismissible(
                          key: ValueKey(item.title + index.toString()),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.delete_forever,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) {
                            final removed = notifier.removeAt(index);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${removed.title} removed'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    notifier.insertAt(index, removed);
                                  },
                                ),
                              ),
                            );
                          },
                          child: ShopCard(product: item),
                        ),
                      ),
                    );
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
