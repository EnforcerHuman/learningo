import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';

/// Top emerald gradient banner card displaying unit number, chapter name, and unit title.
class UnitHeaderCard extends StatelessWidget {
  final int unitNumber;
  final String chapterTitle;
  final String unitTitle;

  const UnitHeaderCard({
    super.key,
    required this.unitNumber,
    required this.chapterTitle,
    required this.unitTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.unitGradientStart,
            AppColors.unitGradientEnd,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Unit pill badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.unitBadgePill,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'UNIT $unitNumber',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: AppColors.textWhite,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Chapter subtitle
          Text(
            chapterTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textWhite,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 8),
          // Large Unit title
          Text(
            unitTitle,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: AppColors.textWhite,
              letterSpacing: -0.5,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
