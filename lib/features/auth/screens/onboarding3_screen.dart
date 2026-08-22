import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';
import 'package:zavora/generated/assets.dart';

class OnBoarding3Screen extends StatefulWidget {
  const OnBoarding3Screen({super.key});

  @override
  State<OnBoarding3Screen> createState() => _OnBoarding3ScreenState();
}

class _OnBoarding3ScreenState extends State<OnBoarding3Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Container(
                width: double.infinity,
                height: size.height * 0.48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child:
                      Image.asset(
                            Assets.on2,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          )
                          .animate(delay: 100.ms)
                          .fadeIn(duration: 500.ms)
                          .slideY(begin: 0.08, end: 0, duration: 500.ms),
                ),
              ),

              const SizedBox(height: 20),
              MyText(
                text: "All Types Of Offers Within Your Reach",
                color: AppColors.background,
                size: 24,
                weight: FontWeight.bold,
              ),

              // 20% Discount

              // New Arrival Product
              const SizedBox(height: 22),

              // Description
              MyText(
                text: 'Publish up your selfies to make yourself more beautiful with this app.',
                color: const Color(0xFF777777),
                size: 20,
                weight: FontWeight.w400,
                lineHeight: 1.45,
              ),

              const Spacer(),

              // Bottom controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Page indicators
                  Row(
                    children: [
                      _buildDot(),

                      const SizedBox(width: 12),
                      _buildDot(),

                      const SizedBox(width: 12),
                      Container(
                        width: 45,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),

                  // Next button
                  GestureDetector(
                    onTap: () {
                      context.goNamed('login');
                    },
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 38,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 15,
      height: 15,
      decoration: const BoxDecoration(
        color: Color(0xFFE5E5E5),
        shape: BoxShape.circle,
      ),
    );
  }
}
