import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';

/// Interactive slide widget presenting concept/theory learning content with media and key facts.
class LearnContentWidget extends StatelessWidget {
  final QuestionEntity question;

  const LearnContentWidget({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Main Learn Card Container
          Container(
            decoration: BoxDecoration(
              color: AppColors.statCardBackground,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: AppColors.questionCardBorder,
                width: 1.5,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Header Row
                Row(
                  children: [
                    // LEARN pill badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.learnTagBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'LEARN',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textWhite,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Title
                    Expanded(
                      child: Text(
                        question.title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Step Badge (e.g. "1 / 14")
                    if (question.conceptStepBadge != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.learnTagBackground,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          question.conceptStepBadge!,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textWhite,
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 14),

                // Image / Illustration Box
                Container(
                  height: 240,
                  decoration: BoxDecoration(
                    color: AppColors.screenBackground,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.imageCardBorder,
                      width: 1,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.landscape_rounded,
                            size: 56,
                            color: AppColors.statNumberGreen.withValues(alpha: 0.5),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            question.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Zoom instruction
                const Center(
                  child: Text(
                    '⤢ tap the image — see it bigger',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Bullet Points
                if (question.bullets != null)
                  ...question.bullets!.map((bullet) => _buildBulletItem(bullet)),

                const SizedBox(height: 12),

                // Social Memory Stat Pill
                if (question.memoryText != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.communityBadgeBackground,
                      borderRadius: BorderRadius.circular(12),
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
                            question.memoryText!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.communityBadgeText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildBulletItem(BulletPointEntity bullet) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dot Indicator
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: bullet.isGreen
                    ? AppColors.bulletGreenDot
                    : AppColors.bulletBlueDot,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Text & Tag Content
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  height: 1.4,
                ),
                children: [
                  TextSpan(text: bullet.text),
                  if (bullet.highlightTag != null) ...[
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.yearTagBackground,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          bullet.highlightTag!,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppColors.yearTagText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
