import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';

/// Reusable feedback explanation card shown after submitting an answer.
class QuestionFeedbackCard extends StatelessWidget {
  final bool isCorrect;
  final String correctLabel;
  final String explanation;

  const QuestionFeedbackCard({
    super.key,
    required this.isCorrect,
    required this.correctLabel,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isCorrect
        ? AppColors.feedbackCorrectBackground
        : AppColors.feedbackIncorrectBackground;

    final border = isCorrect
        ? AppColors.feedbackCorrectBorder
        : AppColors.feedbackIncorrectBorder;

    final titleColor = isCorrect
        ? AppColors.feedbackCorrectTitle
        : AppColors.feedbackIncorrectTitle;

    final subColor = isCorrect
        ? AppColors.feedbackCorrectSub
        : AppColors.feedbackIncorrectSub;

    final iconPrefix = isCorrect ? '✓' : '✗';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: border,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Correct Answer Header
          Text(
            '$iconPrefix Correct answer: $correctLabel',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 8),
          // "WHY IT IS CORRECT" Subtitle
          Text(
            'WHY IT IS CORRECT',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: subColor,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 6),
          // Explanation Body
          Text(
            explanation,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
