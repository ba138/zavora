import 'package:flutter/material.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';
import 'package:zavora/features/notification/widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
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
    final notifications = [
      const NotificationCard(
        icon: Icons.local_offer_outlined,
        title: 'New offer for you',
        message: 'Enjoy 20% off your next order this week.',
        time: 'Just now',
        isUnread: true,
      ),
      const NotificationCard(
        icon: Icons.local_shipping_outlined,
        title: 'Your order is on its way',
        message: 'Order #ZV-2048 has been shipped and is arriving soon.',
        time: '2 hours ago',
      ),
      const NotificationCard(
        icon: Icons.favorite_border_rounded,
        title: 'Back in your favorites',
        message: 'A product from your wishlist is available again.',
        time: 'Yesterday',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText(
                text: 'Notifications',
                size: 28,
                weight: FontWeight.w700,
                color: AppColors.background,
              ),
              const SizedBox(height: 6),
              const MyText(
                text: 'Stay up to date with your Zavora activity.',
                size: 14,
                color: AppColors.background,
              ),
              const SizedBox(height: 24),
              ...notifications.asMap().entries.map((entry) {
                final index = entry.key;
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == notifications.length - 1 ? 0 : 12,
                  ),
                  child: FadeTransition(
                    opacity: _fadeAnimation(index),
                    child: SlideTransition(
                      position: _slideAnimation(index),
                      child: entry.value,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
