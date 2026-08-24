import 'package:flutter/material.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';
import 'package:zavora/contants/my_button.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  MyText(
                    text: "My Order",
                    color: AppColors.background,
                    size: 20,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: MyBorderButton(
                      buttonText: "ongoing",
                      onTap: () {},
                      bgColor: Colors.transparent,
                      textColor: AppColors.background,
                      borderColor: AppColors.background,
                      radius: 8,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: MyButton(
                      buttonText: "Complete",
                      onTap: () {},
                      radius: 8,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
