import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';

/// Reusable True/False Question widget with side-by-side selectable action cards.
class TrueFalseQuestionWidget extends StatelessWidget {
  final QuestionEntity question;
  final String? selectedOptionId;
  final bool isEvaluated;
  final ValueChanged<String>? onSelectOption;
  final VoidCallback? onFiftyFiftyTap;

  const TrueFalseQuestionWidget({
    super.key,
    required this.question,
    this.selectedOptionId,
    this.isEvaluated = false,
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
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
                // Question Statement
                Text(
                  question.title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    height: 1.3,
                    letterSpacing: -0.3,
                  ),
                  textAlign: TextAlign.left,
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

          // Side-by-side True / False Option Cards
          Row(
            children: [
              Expanded(
                child: _buildChoiceCard(
                  optionId: 'tf_true',
                  label: 'TRUE',
                  isTrueChoice: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildChoiceCard(
                  optionId: 'tf_false',
                  label: 'FALSE',
                  isTrueChoice: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceCard({
    required String optionId,
    required String label,
    required bool isTrueChoice,
  }) {
    final isSelected = selectedOptionId == optionId;
    final isCorrect = question.correctOptionId == optionId;

    Color border = isTrueChoice
        ? AppColors.trueFalseTrueBorder
        : AppColors.trueFalseFalseBorder;
    Color bg = AppColors.statCardBackground;
    Color textColor = isTrueChoice
        ? AppColors.statNumberGreen
        : AppColors.optionIncorrectBadge;

    if (isEvaluated) {
      if (isSelected && !isCorrect) {
        bg = AppColors.optionIncorrectBackground;
        border = AppColors.optionIncorrectBorder;
      } else if (isCorrect) {
        bg = AppColors.optionCorrectBackground;
        border = AppColors.optionCorrectBorder;
      }
    } else if (isSelected) {
      bg = isTrueChoice
          ? AppColors.toggleActiveBackground
          : AppColors.optionIncorrectBackground;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEvaluated ? null : () => onSelectOption?.call(optionId),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: border,
              width: 1.8,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon Badge Box
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isTrueChoice
                      ? AppColors.toggleActiveBackground
                      : AppColors.optionIncorrectBackground,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isTrueChoice
                        ? AppColors.trueFalseTrueBorder
                        : AppColors.trueFalseFalseBorder,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Icon(
                    isTrueChoice ? Icons.check_rounded : Icons.close_rounded,
                    size: 18,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Label
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
