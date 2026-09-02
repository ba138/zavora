import 'package:flutter/material.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';

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
              // const SizedBox(width: 8),
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
              const SizedBox(width: 6),
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
