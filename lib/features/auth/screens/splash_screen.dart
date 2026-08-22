import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/generated/assets.dart';

import '../../../contants/myText.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).chain(CurveTween(curve: Curves.easeIn)).animate(_animationController);

    _scaleAnimation = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).chain(CurveTween(curve: Curves.easeOut)).animate(_animationController);

    _animationController.forward();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.goNamed('onboarding1');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(Assets.logo, fit: BoxFit.cover)),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: MyText(
                  text: "Zavora",
                  size: 100,
                  weight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
