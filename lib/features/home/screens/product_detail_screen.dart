import 'package:flutter/material.dart';
import 'package:zavora/contants/common_image_view.dart';
import 'package:zavora/model/productItem_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductItem product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CommonImageView(
                  imagePath: widget.product.image,
                  width: double.infinity,
                  height: 280,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.product.title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ),
                  Icon(
                    widget.product.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.product.subtitle,
                style: const TextStyle(fontSize: 16, color: Color(0xFF666666)),
              ),
              const SizedBox(height: 18),
              Text(
                '\$${widget.product.price}',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111111),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'A premium product designed for everyday comfort and style. Crafted with attention to detail for a refined look and feel.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Color(0xFF444444),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
