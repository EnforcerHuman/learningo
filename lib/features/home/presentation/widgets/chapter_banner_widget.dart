import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/app_typography.dart';

/// Floating chapter banner card displaying chapter number, name, and action menu.
class ChapterBannerWidget extends StatelessWidget {
  final String chapterNumber;
  final String chapterTitle;
  final VoidCallback? onMenuTap;

  const ChapterBannerWidget({
    super.key,
    this.chapterNumber = 'CHAPTER 1',
    this.chapterTitle = 'Important Days',
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.chapterGradientStart,
            AppColors.chapterGradientEnd,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.chapterShadow,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 16, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      chapterNumber,
                      style: AppTypography.chapterOverline,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      chapterTitle,
                      style: AppTypography.chapterTitle,
                    ),
                  ],
                ),
              ),
            ),
            // Right menu button
            InkWell(
              onTap: onMenuTap,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.chapterMenuButton,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Icon(
                  Icons.menu_rounded,
                  color: AppColors.textWhite,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
