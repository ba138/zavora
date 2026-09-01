import 'package:flutter/material.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
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
                const ProfileTextRow(
                  label: 'Email',
                  value: 'Fscreation441@gmail.com',
                ),
                const SizedBox(height: 18),
                const MyText(
                  text: 'Settings',
                  size: 28,
                  weight: FontWeight.w800,
                  color: Color(0xFF151515),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: const Color(0xFFE4E4E4)),
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
                        trailing: _SwitchToggle(isEnabled: true),
                      ),
                      SettingRow(
                        icon: Icons.nightlight_round,
                        title: 'Drak Mood',
                        value: 'off',
                        trailing: _SwitchToggle(isEnabled: true),
                      ),
                      SettingRow(
                        icon: Icons.help_outline_rounded,
                        title: 'Help Center',
                        hasArrow: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF171717),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      elevation: 0,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout_rounded, size: 24),
                        SizedBox(width: 10),
                        MyText(
                          text: 'Log Out',
                          size: 22,
                          weight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: const Color(0xFFE6E6E6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.network(
              'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=600&q=80',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 8,
          bottom: 6,
          child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(Icons.edit, color: Colors.white, size: 18),
          ),
        ),
      ],
    );
  }
}

class ProfileTextRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileTextRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 96,
              child: MyText(
                text: label,
                size: 18,
                weight: FontWeight.w400,
                color: AppColors.background,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: value,
                  size: 18,
                  weight: FontWeight.w500,
                  color: AppColors.background,
                ),
              ),
            ),
          ],
        ),
        Divider(
          height: 20,
          thickness: 1.2,
          color: AppColors.background.withValues(alpha: 0.2),
        ),
      ],
    );
  }
}

class GenderSelectorRow extends StatelessWidget {
  const GenderSelectorRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 96,
          child: MyText(
            text: 'Gender',
            size: 18,
            weight: FontWeight.w400,
            color: AppColors.background,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.radio_button_checked,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: 'Male',
                        size: 18,
                        weight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFD8D8D8)),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.radio_button_off_rounded,
                        color: Color(0xFF2B2B2B),
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: 'Female',
                        size: 18,
                        weight: FontWeight.w500,
                        color: const Color(0xFF2B2B2B),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SettingRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final Widget? trailing;
  final bool hasArrow;

  const SettingRow({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.trailing,
    this.hasArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFEDEDED))),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFE4E4E4),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF1D1D1D), size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: MyText(
              text: title,
              size: 22,
              weight: FontWeight.w500,
              color: const Color(0xFF171717),
            ),
          ),
          if (value != null) ...[
            MyText(
              text: value!,
              size: 18,
              weight: FontWeight.w400,
              color: const Color(0xFF666666),
            ),
            const SizedBox(width: 8),
          ],
          if (trailing != null) trailing!,
          if (hasArrow)
            const Icon(
              Icons.chevron_right_rounded,
              size: 28,
              color: Color(0xFF202020),
            ),
        ],
      ),
    );
  }
}

class _SwitchToggle extends StatelessWidget {
  final bool isEnabled;

  const _SwitchToggle({required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.05,
      child: Switch(
        value: isEnabled,
        onChanged: (_) {},
        activeColor: Colors.white,
        activeTrackColor: const Color(0xFF1C1C1C),
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: const Color(0xFFD9D9D9),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
