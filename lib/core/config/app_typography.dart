import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';

/// Centralized typography definitions for the application.
abstract final class AppTypography {
  // Header
  static const TextStyle headerTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColors.textWhite,
    letterSpacing: -0.2,
  );

  static const TextStyle headerSubtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textWhite85,
  );

  static const TextStyle headerPercentage = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
  );

  static const TextStyle syllabusButtonText = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  static const TextStyle willHelpLabel = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite70,
    letterSpacing: 1.2,
    height: 1.1,
  );

  static const TextStyle examChipText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
  );

  // Chapter Banner
  static const TextStyle chapterOverline = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite70,
    letterSpacing: 1.5,
  );

  static const TextStyle chapterTitle = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w800,
    color: AppColors.textWhite,
    letterSpacing: -0.3,
  );

  // Roadmap Nodes
  static const TextStyle nodeTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.2,
  );

  static const TextStyle badgeSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.8,
  );

  static const TextStyle statusPill = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  // Floating Actions
  static const TextStyle languageToggle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w800,
    color: AppColors.languageTextColor,
  );
}
