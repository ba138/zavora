import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';
import 'package:zavora/contants/myText_filed.dart';
import 'package:zavora/contants/my_button.dart';
import 'package:zavora/features/auth/widgets/platfrom_button.dart';
import 'package:zavora/generated/assets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: MyText(
                    text: "Zavora",
                    size: 60,
                    weight: FontWeight.w600,
                    color: AppColors.onSecondary,
                  ),
                ),
                const SizedBox(height: 30),
                MyText(
                  text: "Sign In",
                  color: AppColors.background,
                  size: 24,
                  weight: FontWeight.bold,
                ),
                MyText(
                  text: 'Please Sign In To Continue Our App.',
                  color: const Color(0xFF777777),
                  size: 16,
                  weight: FontWeight.w400,
                  lineHeight: 1.45,
                ),
                const SizedBox(height: 30),
                MyTextField(
                  label: "UserName",
                  hint: "Ali",
                  prefix: const Icon(
                    Icons.email_outlined,
                    color: AppColors.primary,
                  ),
                ),

                MyTextField(
                  label: "Email",
                  hint: "Enter your email",
                  prefix: const Icon(
                    Icons.email_outlined,
                    color: AppColors.primary,
                  ),
                ),
                MyTextField(
                  label: "Password",

                  hint: "Enter your password",
                  prefix: const Icon(
                    Icons.lock_outlined,
                    color: AppColors.primary,
                  ),
                  isObSecure: true,
                ),
                MyTextField(
                  label: "Confirm Password",

                  hint: "Enter your password again",
                  prefix: const Icon(
                    Icons.lock_outlined,
                    color: AppColors.primary,
                  ),
                  isObSecure: true,
                ),
                const SizedBox(height: 40),
                MyButton(onTap: () {}, buttonText: "Register", radius: 12),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.onSecondary,
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(width: 12),
                    MyText(
                      text: "OR",
                      size: 14,
                      weight: FontWeight.bold,
                      color: AppColors.onSecondary,
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Divider(
                        color: AppColors.onSecondary,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                PlatformButton(
                  text: "Google",
                  imagePath: Assets.google,
                  onTap: () {},
                  backgroundColor: AppColors.onSecondary,
                  borderColor: AppColors.onSecondary,
                  textColor: AppColors.primary,
                ),
                const SizedBox(height: 10),

                PlatformButton(
                  text: "Apple",
                  imagePath: Assets.apple,
                  onTap: () {},
                  backgroundColor: AppColors.onSecondary,
                  borderColor: AppColors.onSecondary,
                  textColor: AppColors.primary,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: "Already have an account?",
                      size: 16,
                      weight: FontWeight.w400,

                      color: const Color(0xFF777777),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        context.goNamed('login');
                      },
                      child: MyText(
                        text: "Login",
                        size: 16,
                        weight: FontWeight.bold,
                        color: AppColors.onSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
