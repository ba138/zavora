import 'package:flutter/material.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';

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
