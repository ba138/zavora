import 'package:flutter/material.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';

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
              size: 18,
              weight: FontWeight.w500,
              color: AppColors.background,
            ),
          ),
          if (value != null) ...[
            MyText(
              text: value!,
              size: 18,
              weight: FontWeight.w400,
              color: AppColors.background,
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

class SwitchToggle extends StatelessWidget {
  final bool isEnabled;

  const SwitchToggle({required this.isEnabled});

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
