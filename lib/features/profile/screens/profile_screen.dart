import 'package:flutter/material.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';
import 'package:zavora/features/profile/widgets/avatar_widget.dart';
import 'package:zavora/features/profile/widgets/gender_widget.dart';
import 'package:zavora/features/profile/widgets/profile_text_widget.dart';
import 'package:zavora/features/profile/widgets/setting_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
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
    final start = (index * 0.12).clamp(0.0, 0.75);
    final end = (start + 0.25).clamp(0.0, 1.0);

    return CurvedAnimation(
      parent: _controller,
      curve: Interval(start, end, curve: Curves.easeOut),
    );
  }

  Animation<Offset> _slideAnimation(int index) {
    final start = (index * 0.12).clamp(0.0, 0.75);
    final end = (start + 0.25).clamp(0.0, 1.0);

    return Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widgets = [
      Center(
        child: Column(
          children: [
            const ProfileAvatar(),
            const SizedBox(height: 12),
            const MyText(
              text: 'Upload image',
              size: 18,
              weight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
      const SizedBox(height: 12),
      const ProfileTextRow(label: 'Name', value: 'Fscreation'),
      const SizedBox(height: 10),
      const GenderSelectorRow(),
      const SizedBox(height: 10),
      const ProfileTextRow(label: 'Age', value: '22 Year'),
      const SizedBox(height: 10),
      const ProfileTextRow(label: 'Email', value: 'Fscreation441@gmail.com'),
      const SizedBox(height: 18),
      const MyText(
        text: 'Settings',
        size: 20,
        weight: FontWeight.w800,
        color: Color(0xFF151515),
      ),
      const SizedBox(height: 14),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0xFFE4E4E4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Column(
          children: [
            SettingRow(
              icon: Icons.language_rounded,
              title: 'Language',
              value: 'English',
              hasArrow: true,
            ),
            SettingRow(
              icon: Icons.notifications_none_rounded,
              title: 'Notification',
              trailing: SwitchToggle(isEnabled: true),
            ),
            SettingRow(
              icon: Icons.nightlight_round,
              title: 'Drak Mood',
              value: 'off',
              trailing: SwitchToggle(isEnabled: true),
            ),
            SettingRow(
              icon: Icons.help_outline_rounded,
              title: 'Help Center',
              hasArrow: true,
            ),
            SettingRow(
              icon: Icons.logout_rounded,
              title: 'Log Out',
              hasArrow: true,
            ),
          ],
        ),
      ),
      const SizedBox(height: 18),
    ];

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgets.asMap().entries.map((entry) {
                final index = entry.key;
                final child = entry.value;

                return FadeTransition(
                  opacity: _fadeAnimation(index),
                  child: SlideTransition(
                    position: _slideAnimation(index),
                    child: child,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
