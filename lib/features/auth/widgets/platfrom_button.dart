import 'package:flutter/material.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';

class PlatformButton extends StatelessWidget {
  final String? imagePath;
  final String text;
  final VoidCallback? onTap;
  final double? width;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final double imageSize;
  final EdgeInsetsGeometry padding;
  final MainAxisAlignment alignment;
  final TextStyle? textStyle;

  const PlatformButton({
    super.key,
    this.imagePath,
    required this.text,
    this.onTap,
    this.width,
    this.height = 56,
    this.borderRadius = 16,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.imageSize = 24,
    this.padding = const EdgeInsets.symmetric(horizontal: 18),
    this.alignment = MainAxisAlignment.center,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: 50,
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: 1.2),
        ),
        child: Row(
          mainAxisAlignment: alignment,
          children: [
            Image.asset(imagePath ?? "", height: 30),
            const SizedBox(width: 12),
            MyText(
              text: "Continue with ",
              size: 16,
              weight: FontWeight.w500,
              color: AppColors.onSecondary,
            ),
            MyText(
              text: text,
              size: 16,
              weight: FontWeight.bold,
              color: AppColors.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
