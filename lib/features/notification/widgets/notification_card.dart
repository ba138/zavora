import 'package:flutter/material.dart';
import 'package:zavora/contants/app_colors.dart';
import 'package:zavora/contants/myText.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String time;
  final bool isUnread;
  final VoidCallback? onTap;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.time,
    this.isUnread = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        shadowColor: Colors.black.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isUnread ? const Color(0xFFF2F6FF) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isUnread
                  ? const Color(0xFFB7CCF5)
                  : const Color(0xFFD6D9E0),
              width: 1.2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: isUnread ? AppColors.primary : const Color(0xFFF1F5F9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isUnread ? Colors.white : AppColors.background,
                  size: 21,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: MyText(
                            text: title,
                            size: 15,
                            weight: FontWeight.w700,
                            color: AppColors.background,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isUnread) ...[
                          const SizedBox(width: 8),
                          Container(
                            width: 7,
                            height: 7,
                            margin: const EdgeInsets.only(top: 5),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      text: message,
                      size: 13,
                      lineHeight: 1.35,
                      color: AppColors.background,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    MyText(
                      text: time,
                      size: 12,
                      weight: FontWeight.w500,
                      color: AppColors.background,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
