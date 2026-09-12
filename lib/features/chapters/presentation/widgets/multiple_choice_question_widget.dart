import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';

/// Reusable Multiple Choice Question widget supporting default, evaluated, and 50:50 lifeline states.
class MultipleChoiceQuestionWidget extends StatelessWidget {
  final QuestionEntity question;
  final String? selectedOptionId;
  final bool isEvaluated;
  final Set<String> disabledOptionIds;
  final ValueChanged<String>? onSelectOption;
  final VoidCallback? onFiftyFiftyTap;

  const MultipleChoiceQuestionWidget({
    super.key,
    required this.question,
    this.selectedOptionId,
    this.isEvaluated = false,
    this.disabledOptionIds = const {},
    this.onSelectOption,
    this.onFiftyFiftyTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Question Headline Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            decoration: BoxDecoration(
              color: AppColors.statCardBackground,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: AppColors.questionCardBorder,
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                // Tag pill
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.questionTagBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    question.tagText,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppColors.questionTagText,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Question Title
                Text(
                  question.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // 50:50 Lifeline Button
          Center(
            child: InkWell(
              onTap: isEvaluated ? null : onFiftyFiftyTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.statCardBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.lifelineBorder,
                    width: 1,
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('✂', style: TextStyle(fontSize: 13)),
                    SizedBox(width: 6),
                    Text(
                      '50:50',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lifelineText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Options List
          if (question.options != null)
            ...question.options!.map((option) {
              final isDisabled = disabledOptionIds.contains(option.id);
              if (isDisabled) return const SizedBox.shrink();

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _buildOptionCard(option),
              );
            }),
        ],
      ),
    );
  }

  Widget _buildOptionCard(QuestionOptionEntity option) {
    final isSelected = selectedOptionId == option.id;
    final isCorrectOption = option.id == question.correctOptionId;

    Color bg = AppColors.optionCardBackground;
    Color border = AppColors.optionCardBorder;
    Color badgeBg = AppColors.optionBadgeBackground;
    Color badgeText = AppColors.optionBadgeText;
    Color textColor = AppColors.textPrimary;

    if (isEvaluated) {
      if (isSelected && !isCorrectOption) {
        // Incorrect selected option
        bg = AppColors.optionIncorrectBackground;
        border = AppColors.optionIncorrectBorder;
        badgeBg = AppColors.optionIncorrectBadge;
        badgeText = AppColors.textWhite;
        textColor = AppColors.optionIncorrectText;
      } else if (isCorrectOption) {
        // Correct option
        bg = AppColors.optionCorrectBackground;
        border = AppColors.optionCorrectBorder;
        badgeBg = AppColors.optionCorrectBadge;
        badgeText = AppColors.textWhite;
        textColor = AppColors.optionCorrectText;
      }
    } else if (isSelected) {
      // Selected before evaluation
      bg = AppColors.toggleActiveBackground;
      border = AppColors.toggleActiveBorder;
      badgeBg = AppColors.statNumberGreen;
      badgeText = AppColors.textWhite;
      textColor = AppColors.textPrimary;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEvaluated ? null : () => onSelectOption?.call(option.id),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: border,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              // Letter Badge (A, B, C, D)
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    option.code,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: badgeText,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Option Text
              Expanded(
                child: Text(
                  option.text,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: textColor,
                  ),
                ),
              ),
              // Trailing Chevron
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.optionChevron,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
