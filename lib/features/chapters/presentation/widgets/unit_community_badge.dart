import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';

/// Community completion statistic pill badge displayed under the topics list.
class UnitCommunityBadge extends StatelessWidget {
  final String text;

  const UnitCommunityBadge({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: AppColors.communityBadgeBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.people_alt_rounded,
            size: 16,
            color: AppColors.communityIconColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.communityBadgeText,
                letterSpacing: -0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
