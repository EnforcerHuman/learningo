import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';

/// Dynamic bottom action button adapting to question type and evaluation state.
class QuestionBottomBar extends StatelessWidget {
  final QuestionType questionType;
  final bool isEvaluated;
  final bool isCorrect;
  final bool hasSelection;
  final VoidCallback? onPressed;

  const QuestionBottomBar({
    super.key,
    required this.questionType,
    required this.isEvaluated,
    required this.isCorrect,
    required this.hasSelection,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String label;
    Color bg;
    Color textColor;
    bool isEnabled;

    if (questionType == QuestionType.learn) {
      label = 'Continue →';
      bg = AppColors.startButtonGreen;
      textColor = AppColors.textWhite;
      isEnabled = true;
    } else if (questionType == QuestionType.matchPairs) {
      label = hasSelection ? '4/4 PAIRED' : 'PAIR ALL ITEMS';
      bg = hasSelection
          ? AppColors.startButtonGreen
          : AppColors.disabledButtonBackground;
      textColor = AppColors.textWhite;
      isEnabled = hasSelection;
    } else if (isEvaluated) {
      if (isCorrect) {
        label = 'CONTINUE';
        bg = AppColors.startButtonGreen;
        textColor = AppColors.textWhite;
      } else {
        label = 'GOT IT';
        bg = AppColors.incorrectGotItButton;
        textColor = AppColors.textWhite;
      }
      isEnabled = true;
    } else {
      label = 'PICK AN ANSWER';
      bg = AppColors.disabledButtonBackground;
      textColor = AppColors.disabledButtonText;
      isEnabled = hasSelection;
    }

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          disabledBackgroundColor: AppColors.disabledButtonBackground,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: isEnabled ? textColor : AppColors.disabledButtonText,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }
}
