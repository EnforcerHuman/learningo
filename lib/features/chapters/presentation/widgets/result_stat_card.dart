import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/responsive_utils.dart';

/// Single metric stat card on the Result screen (e.g. Accuracy, Your Time, Class Average).
class ResultStatCard extends StatelessWidget {
  final String value;
  final String label;
  final bool isHighlighted;

  const ResultStatCard({
    super.key,
    required this.value,
    required this.label,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: responsive.scale(14),
          horizontal: responsive.scale(8),
        ),
        decoration: BoxDecoration(
          color: AppColors.statCardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isHighlighted
                ? AppColors.resultStatBorder
                : AppColors.resultStatBorderInactive,
            width: isHighlighted ? 1.8 : 1.2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: responsive.font(19),
                fontWeight: FontWeight.w800,
                color: isHighlighted
                    ? AppColors.resultStatTextHighlight
                    : AppColors.textPrimary,
                letterSpacing: -0.2,
              ),
            ),
            SizedBox(height: responsive.scale(4)),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: responsive.font(12),
                fontWeight: isHighlighted ? FontWeight.w700 : FontWeight.w500,
                color: isHighlighted
                    ? AppColors.resultStatSubtitleHighlight
                    : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
