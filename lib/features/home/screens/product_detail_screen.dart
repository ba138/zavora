import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zavora/contants/common_image_view.dart';
import 'package:zavora/contants/myText.dart';
import 'package:zavora/features/home/providers/home_provider.dart';
import 'package:zavora/model/productItem_model.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final ProductItem product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  late final AnimationController _animationController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();

    Future.microtask(() {
      ref
          .read(productDetailProvider.notifier)
          .initialize(
            isFavorite: widget.product.isFavorite,
            quantity: 1,
            selectedSize: 'L',
          );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  List<String> get _galleryImages {
    final image = widget.product.image;
    if (image.isEmpty) return const [];
    return List.generate(3, (_) => image);
  }

  @override
  Widget build(BuildContext context) {
    final currentProductState = ref.watch(productDetailProvider);
    final galleryImages = _galleryImages;
    final sizes = ['S', 'M', 'L', 'XL', 'XXL'];
    final fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    );
    final slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.18), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeOutCubic))
            .animate(_animationController);

    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEB),
      body: SafeArea(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: _pageController,
                          itemCount: galleryImages.length,
                          onPageChanged: (index) {
                            setState(() => _currentIndex = index);
                          },
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: CommonImageView(
                                  imagePath: galleryImages[index],
                                  height: 300,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  radius: 26,
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 18,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              galleryImages.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: _currentIndex == index ? 22 : 8,
                                height: 8,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(99),
                                  color: _currentIndex == index
                                      ? const Color(0xFF1A1A1A)
                                      : const Color(0xFFB9B9B9),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 12,
                          right: 26,
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(productDetailProvider.notifier)
                                  .toggleFavorite();
                            },
                            child: Container(
                              width: 42,
                              height: 42,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                currentProductState.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: MyText(
                                text: widget.product.title,
                                size: 24,
                                weight: FontWeight.w800,
                                color: const Color(0xFF131313),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(productDetailProvider.notifier)
                                          .decrement();
                                    },
                                    child: const MyText(
                                      text: '-',
                                      size: 20,
                                      weight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 18),
                                  MyText(
                                    text: '${currentProductState.quantity}',
                                    size: 18,
                                    weight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(width: 18),
                                  GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(productDetailProvider.notifier)
                                          .increment();
                                    },
                                    child: const MyText(
                                      text: '+',
                                      size: 22,
                                      weight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        MyText(
                          text: widget.product.subtitle,
                          size: 16,
                          color: const Color(0xFF5C5C5C),
                          weight: FontWeight.w500,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            ...List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Color(0xFFF8B500),
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const MyText(
                              text: '(320 Review)',
                              size: 16,
                              color: Color(0xFF5A5A5A),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const MyText(
                              text: 'Size',
                              size: 20,
                              weight: FontWeight.w800,
                              color: Colors.black,
                            ),
                            const MyText(
                              text: 'Available in stok',
                              size: 16,
                              weight: FontWeight.w600,
                              color: Color(0xFF2A2A2A),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: sizes.map((size) {
                            final selected =
                                currentProductState.selectedSize == size;
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: size != sizes.last ? 10 : 0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(productDetailProvider.notifier)
                                        .selectSize(size);
                                  },
                                  child: Container(
                                    height: 54,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: selected
                                          ? Colors.black
                                          : const Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: MyText(
                                      text: size,
                                      size: 18,
                                      weight: FontWeight.w700,
                                      color: selected
                                          ? Colors.white
                                          : const Color(0xFF303030),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const MyText(
                              text: 'Description',
                              size: 20,
                              weight: FontWeight.w800,
                              color: Colors.black,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Color(0xFFEFEFEF),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const MyText(
                          text: 'Get a little lift from these Sam Edelman sandals featuring ruched straps and leather lace-up ties, while a braided jute sole makes a fresh statement for summer.',
                          size: 15,
                          color: Color(0xFF4C4C4C),
                          lineHeight: 1.55,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyText(
                                    text: 'Total Price',
                                    size: 14,
                                    color: Color(0xFFC8C8C8),
                                  ),
                                  const SizedBox(height: 4),
                                  MyText(
                                    text: '\$${widget.product.price}',
                                    size: 30,
                                    weight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  MyText(
                                    text: 'Add to cart',
                                    size: 22,
                                    weight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
