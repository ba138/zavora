import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zavora/features/home/providers/home_provider.dart';
import 'package:zavora/features/home/widgets/catogery_card.dart';
import 'package:zavora/generated/assets.dart';
import 'package:zavora/model/productItem_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  final products = [
    {
      "image": Assets.newArrivals,
      "text": "New Collection\n200",
      "textOnLeft": true,
    },
    {"image": Assets.shirts, "text": "Shirts\n200", "textOnLeft": false},
    {"image": Assets.bags, "text": "Bags\n200", "textOnLeft": true},
    {
      "image": Assets.electronic,
      "text": "Electronics\n200",
      "textOnLeft": false,
    },
    {"image": Assets.shoes, "text": "Shoes\n200", "textOnLeft": false},
  ];

  late AnimationController _controller;

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

  List<ProductItem> _getProductsForCategory(String categoryText) {
    final allProducts = ref.read(homeProductsProvider);
    final shoesProducts = ref.read(homeShoesProvider);
    final bagProducts = ref.read(homeBagsProvider);
    final electronicsProducts = ref.read(homeElectronicsProvider);

    switch (categoryText) {
      case 'New Collection\n200':
        return allProducts;
      case 'Shirts\n200':
        return allProducts;
      case 'Bags\n200':
        return bagProducts;
      case 'Electronics\n200':
        return electronicsProducts;
      case 'Shoes\n200':
        return shoesProducts;
      default:
        return const [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                ...products.asMap().entries.map((entry) {
                  final index = entry.key;
                  final product = entry.value;

                  return FadeTransition(
                    opacity: _fadeAnimation(index),
                    child: SlideTransition(
                      position: _slideAnimation(index),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CatogeryCard(
                          image: product["image"] as String,
                          text: product["text"] as String,
                          textOnLeft: product["textOnLeft"] as bool,
                          onTap: () {
                            final selectedList = _getProductsForCategory(
                              product["text"] as String,
                            );
                            final title = (product["text"] as String)
                                .split('\n')
                                .first
                                .trim();

                            context.push(
                              '/product?title=${Uri.encodeComponent(title)}',
                              extra: selectedList,
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
