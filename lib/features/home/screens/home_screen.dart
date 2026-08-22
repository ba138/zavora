import 'package:flutter/material.dart';
import 'package:zavora/features/home/widgets/home_card.dart';
import 'package:zavora/generated/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final products = [
    {
      "image": Assets.newArrivals,
      "text": "New Collection\n200",
      "textOnLeft": true,
    },
    {
      "image": Assets.shirts,
      "text": "New Collection\n200",
      "textOnLeft": false,
    },
    {"image": Assets.bags, "text": "New Collection\n200", "textOnLeft": true},
    {
      "image": Assets.electronic,
      "text": "New Collection\n200",
      "textOnLeft": false,
    },
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
                        child: HomeCard(
                          image: product["image"] as String,
                          text: product["text"] as String,
                          textOnLeft: product["textOnLeft"] as bool,
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
