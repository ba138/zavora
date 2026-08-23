import 'package:flutter/material.dart';
import 'package:zavora/model/productItem_model.dart';

class HomeCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final bool initialFavorite;
  final ValueChanged<bool>? onFavoriteChanged;
  final VoidCallback? onTap;
  final ProductItem? product;
  final double width;
  final double imageHeight;

  const HomeCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    this.initialFavorite = false,
    this.onFavoriteChanged,
    this.onTap,
    this.product,
    this.width = 160,
    this.imageHeight = 180,
  });

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : widget.width;
        final imageHeight = (cardWidth * 0.94).clamp(140.0, 170.0);

        return GestureDetector(
          onTap: widget.onTap,
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            width: cardWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      height: imageHeight,
                      width: cardWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: const Color(0xFFE9E9E8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Image.asset(
                          widget.imagePath,
                          fit: BoxFit.cover,
                          width: cardWidth,
                          height: imageHeight,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: AnimatedScale(
                        scale: isFavorite ? 1.08 : 1,
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeInOut,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                            widget.onFavoriteChanged?.call(isFavorite);
                          },
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 180),
                            transitionBuilder: (child, animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                            child: Container(
                              key: ValueKey<bool>(isFavorite),
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  widget.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${widget.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111111),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
