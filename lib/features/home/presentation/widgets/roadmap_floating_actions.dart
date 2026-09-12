import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/app_typography.dart';

/// Floating utility buttons placed at the bottom-right for language and theme toggles.
class RoadmapFloatingActions extends StatelessWidget {
  final VoidCallback? onLanguageTap;
  final VoidCallback? onThemeTap;

  const RoadmapFloatingActions({
    super.key,
    this.onLanguageTap,
    this.onThemeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCircleButton(
          onTap: onLanguageTap,
          child: const Text(
            'अ A',
            style: AppTypography.languageToggle,
          ),
        ),
        const SizedBox(height: 12),
        _buildCircleButton(
          onTap: onThemeTap,
          child: const Icon(
            Icons.nightlight_round,
            color: AppColors.themeMoonColor,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildCircleButton({
    required Widget child,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.floatingButtonBackground,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: AppColors.floatingButtonShadow,
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
