import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zavora/features/home/widgets/home_card.dart';
import 'package:zavora/model/productItem_model.dart';

class ProductScreen extends ConsumerStatefulWidget {
  final List<ProductItem> products;
  final String title;

  const ProductScreen({super.key, required this.products, required this.title});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Animation<double> _fadeAnimation(int index) {
    final start = (index * 0.08).clamp(0.0, 0.7);
    final end = (start + 0.3).clamp(0.0, 1.0);

    return CurvedAnimation(
      parent: _controller,
      curve: Interval(start, end, curve: Curves.easeOut),
    );
  }

  Animation<Offset> _slideAnimation(int index) {
    final start = (index * 0.08).clamp(0.0, 0.7);
    final end = (start + 0.3).clamp(0.0, 1.0);

    return Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = widget.products;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.title.isNotEmpty ? widget.title : 'Items',
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 276,
            crossAxisSpacing: 14,
            mainAxisSpacing: 18,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return FadeTransition(
              opacity: _fadeAnimation(index),
              child: SlideTransition(
                position: _slideAnimation(index),
                child: HomeCard(
                  imagePath: product.image,
                  title: product.title,
                  subtitle: product.subtitle,
                  price: product.price,
                  initialFavorite: product.isFavorite,
                  product: product,
                  width: 156,
                  imageHeight: 170,
                  onTap: () {
                    context.push('/product-detail', extra: product);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
