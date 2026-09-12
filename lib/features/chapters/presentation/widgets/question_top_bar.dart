import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';

/// Top bar with back button, progress indicator bar with ratio text, menu, and close buttons.
class QuestionTopBar extends StatelessWidget {
  final double progress;
  final String progressText;
  final VoidCallback? onBack;
  final VoidCallback? onMenu;
  final VoidCallback? onClose;

  const QuestionTopBar({
    super.key,
    required this.progress,
    required this.progressText,
    this.onBack,
    this.onMenu,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Back button
          InkWell(
            onTap: onBack,
            borderRadius: BorderRadius.circular(20),
            child: const Padding(
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 22,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Progress bar track with fill
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 10,
                color: AppColors.progressBarTrack,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedFractionallySizedBox(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    widthFactor: progress.clamp(0.05, 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.progressBarFill,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Step ratio text (e.g. "4/17")
          Text(
            progressText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppColors.progressBarText,
            ),
          ),
          const SizedBox(width: 8),
          // Menu button (rounded square outline)
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.backButtonBorder,
                width: 1,
              ),
            ),
            child: InkWell(
              onTap: onMenu,
              borderRadius: BorderRadius.circular(8),
              child: const Icon(
                Icons.menu_rounded,
                size: 16,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Close button
          InkWell(
            onTap: onClose,
            borderRadius: BorderRadius.circular(20),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.close_rounded,
                size: 22,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
