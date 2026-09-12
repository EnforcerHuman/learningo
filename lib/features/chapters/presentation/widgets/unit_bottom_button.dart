import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';

/// Bottom action button for launching/starting unit learning.
class UnitBottomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const UnitBottomButton({
    super.key,
    this.onPressed,
    this.label = 'START →',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.startButtonGreen,
          foregroundColor: AppColors.textWhite,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.0,
            color: AppColors.textWhite,
          ),
        ),
      ),
    );
  }
}
