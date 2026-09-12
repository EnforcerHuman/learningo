import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';

/// Mascot icon widget positioned on interactive question screens.
class QuestionMascotWidget extends StatelessWidget {
  const QuestionMascotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.communityBadgeBackground,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.topicArrowCircleBorder,
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          '🦚',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
