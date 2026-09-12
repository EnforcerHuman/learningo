import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/responsive_utils.dart';
import 'package:learningo/features/chapters/domain/entites/slipped_concept_entity.dart';

/// Single card in the "WHERE YOU SLIPPED" carousel on the Result screen.
class ResultSlippedCard extends StatelessWidget {
  final SlippedConceptEntity concept;

  const ResultSlippedCard({
    super.key,
    required this.concept,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Container(
      width: responsive.scale(136),
      margin: EdgeInsets.only(right: responsive.scale(12)),
      decoration: BoxDecoration(
        color: AppColors.resultSlippedCardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.resultSlippedCardBorder,
          width: 1.2,
        ),
      ),
      child: Column(
        children: [
          // Illustration / Icon Preview Area
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.image_outlined,
                  size: 36,
                  color: AppColors.unitGradientStart.withAlpha(120),
                ),
              ),
            ),
          ),

          // Bottom Concept Label Bar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: const BoxDecoration(
              color: AppColors.textWhite,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Text(
              concept.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
