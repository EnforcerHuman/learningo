import 'package:flutter/material.dart';

/// Centralized color palette for the entire application.
/// All colors used across components and screens are strictly defined here.
abstract final class AppColors {
  // Screen & Background
  static const Color screenBackground = Color(0xFFF4F6F9);
  static const Color homeIndicator = Color(0xFF4B5563);
  static const Color cardShadow = Color(0x12000000);
  static const Color backButtonBackground = Color(0xFFFFFFFF);
  static const Color backButtonBorder = Color(0xFFE2E8F0);
  static const Color backButtonIcon = Color(0xFF1E293B);

  // Top Header (Vibrant Magenta / Pink) - Home Feature
  static const Color headerBackground = Color(0xFFD61F69);
  static const Color headerBackgroundGradientEnd = Color(0xFFC01558);
  static const Color headerTargetBadge = Color(0xFFEA3A6C);
  static const Color headerTargetIcon = Color(0xFFFFFFFF);
  static const Color headerPercentagePill = Color(0x38FFFFFF);
  static const Color headerSyllabusButton = Color(0x2EFFFFFF);
  static const Color headerChipBackground = Color(0x33FFFFFF);
  static const Color headerChipBorder = Color(0x26FFFFFF);

  // Chapter 1 Card (Indigo / Blue Gradient) - Home Feature
  static const Color chapterGradientStart = Color(0xFF4838F5);
  static const Color chapterGradientEnd = Color(0xFF382DE0);
  static const Color chapterMenuButton = Color(0x2EFFFFFF);
  static const Color chapterShadow = Color(0x404838F5);

  // Unit Detail Banner (Emerald Green Gradient) - Chapters Feature
  static const Color unitGradientStart = Color(0xFF289669);
  static const Color unitGradientEnd = Color(0xFF1D6E4C);
  static const Color unitBadgePill = Color(0x38FFFFFF);

  // Metrics Stat Cards - Chapters Feature
  static const Color statCardBackground = Color(0xFFFFFFFF);
  static const Color statCardBorder = Color(0xFFE2E8F0);
  static const Color statNumberGreen = Color(0xFF16A34A);
  static const Color statLabelGrey = Color(0xFF64748B);

  // View Switcher / Segmented Toggle - Chapters Feature
  static const Color toggleActiveBackground = Color(0xFFF0FDF4);
  static const Color toggleActiveBorder = Color(0xFF86EFAC);
  static const Color toggleActiveText = Color(0xFF16A34A);
  static const Color toggleInactiveBackground = Color(0xFFFFFFFF);
  static const Color toggleInactiveBorder = Color(0xFFE2E8F0);
  static const Color toggleInactiveText = Color(0xFF64748B);

  // Topic List Items - Chapters Feature
  static const Color topicListBackground = Color(0xFFFFFFFF);
  static const Color topicListBorder = Color(0xFFE2E8F0);
  static const Color topicItemDivider = Color(0xFFF1F5F9);
  static const Color topicNumberGrey = Color(0xFF64748B);
  static const Color topicArrowGreen = Color(0xFF16A34A);
  static const Color topicArrowCircleBorder = Color(0xFFBBF7D0);

  // Community Completion Badge - Chapters Feature
  static const Color communityBadgeBackground = Color(0xFFECFDF5);
  static const Color communityBadgeText = Color(0xFF334155);
  static const Color communityIconColor = Color(0xFF0D9488);

  // Start Action Button - Chapters Feature
  static const Color startButtonGreen = Color(0xFF22C55E);
  static const Color startButtonGreenEnd = Color(0xFF16A34A);

  // Question & Interactive Screens Colors
  static const Color progressBarTrack = Color(0xFFE2E8F0);
  static const Color progressBarFill = Color(0xFF22C55E);
  static const Color progressBarText = Color(0xFF16A34A);
  static const Color questionCardBorder = Color(0xFF86EFAC);
  static const Color questionTagBackground = Color(0xFFE6F7ED);
  static const Color questionTagText = Color(0xFF16A34A);
  static const Color lifelineBorder = Color(0xFFE2E8F0);
  static const Color lifelineText = Color(0xFF64748B);

  // MCQ Options
  static const Color optionCardBackground = Color(0xFFFFFFFF);
  static const Color optionCardBorder = Color(0xFFE2E8F0);
  static const Color optionBadgeBackground = Color(0xFFF1F5F9);
  static const Color optionBadgeText = Color(0xFF64748B);
  static const Color optionChevron = Color(0xFF94A3B8);
  static const Color optionIncorrectBackground = Color(0xFFFEF2F2);
  static const Color optionIncorrectBorder = Color(0xFFFCA5A5);
  static const Color optionIncorrectBadge = Color(0xFFEF4444);
  static const Color optionIncorrectText = Color(0xFF991B1B);
  static const Color optionCorrectBackground = Color(0xFFF0FDF4);
  static const Color optionCorrectBorder = Color(0xFF86EFAC);
  static const Color optionCorrectBadge = Color(0xFF16A34A);
  static const Color optionCorrectText = Color(0xFF065F46);

  // True / False
  static const Color trueFalseTrueBorder = Color(0xFF86EFAC);
  static const Color trueFalseFalseBorder = Color(0xFFFDA4AF);

  // Feedback Cards
  static const Color feedbackCorrectBackground = Color(0xFFECFDF5);
  static const Color feedbackCorrectBorder = Color(0xFF86EFAC);
  static const Color feedbackCorrectTitle = Color(0xFF047857);
  static const Color feedbackCorrectSub = Color(0xFF059669);
  static const Color feedbackIncorrectBackground = Color(0xFFFFF1F2);
  static const Color feedbackIncorrectBorder = Color(0xFFFDA4AF);
  static const Color feedbackIncorrectTitle = Color(0xFFBE123C);
  static const Color feedbackIncorrectSub = Color(0xFFE11D48);

  // Buttons & Learn Tags
  static const Color disabledButtonBackground = Color(0xFFCBD5E1);
  static const Color disabledButtonText = Color(0xFF64748B);
  static const Color incorrectGotItButton = Color(0xFFE11D48);
  static const Color learnTagBackground = Color(0xFF16A34A);
  static const Color yearTagBackground = Color(0xFFDCFCE7);
  static const Color yearTagText = Color(0xFF15803D);
  static const Color imageCardBorder = Color(0xFFE2E8F0);
  static const Color bulletBlueDot = Color(0xFF3B82F6);
  static const Color bulletGreenDot = Color(0xFF16A34A);

  // Roadmap Path (Dashed Bezier Line)
  static const Color roadmapPath = Color(0xFFA6C5F8);

  // Node: Completed (Emerald Green)
  static const Color completedNodeGreen = Color(0xFF22C55E);
  static const Color completedNodeHalo = Color(0xFFDCFCE7);
  static const Color masteredBadgeBackground = Color(0xFFDCFCE7);
  static const Color masteredBadgeText = Color(0xFF15803D);

  // Node: Active (Royal Blue)
  static const Color activeNodeBlue = Color(0xFF2563EB);
  static const Color activeNodeHalo = Color(0xFFDBEAFE);
  static const Color activeNodeOuterRing = Color(0xFF3B82F6);
  static const Color continueBadgeBackground = Color(0xFF16A34A);
  static const Color continueBadgeText = Color(0xFFFFFFFF);
  static const Color conceptsBadgeBackground = Color(0xFFEEF2FF);
  static const Color conceptsBadgeText = Color(0xFF3B82F6);

  // Node: Test (Golden Amber Quiz)
  static const Color testBadgeBackground = Color(0xFFFEF3C7);
  static const Color testBadgeText = Color(0xFFD97706);
  static const Color testNodeAmber = Color(0xFFF59E0B);
  static const Color testNodeHalo = Color(0xFFFEF3C7);
  static const Color testIconDark = Color(0xFF78350F);
  static const Color testQuestionsBadgeBackground = Color(0xFFF1F5F9);
  static const Color testQuestionsBadgeText = Color(0xFF64748B);
  static const Color starInactive = Color(0xFFCBD5E1);

  // Node: Locked / Upcoming (Lavender Outline)
  static const Color lockedNodeBackground = Color(0xFFF8FAFC);
  static const Color lockedNodeBorder = Color(0xFFC7D2FE);
  static const Color lockedNodeIcon = Color(0xFF818CF8);
  static const Color upcomingBadgeBackground = Color(0xFFF1F5F9);
  static const Color upcomingBadgeText = Color(0xFF64748B);

  // Text Colors
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textWhite70 = Color(0xB3FFFFFF);
  static const Color textWhite85 = Color(0xD9FFFFFF);

  // Floating Action Controls
  static const Color floatingButtonBackground = Color(0xFFFFFFFF);
  static const Color floatingButtonShadow = Color(0x24000000);
  static const Color languageTextColor = Color(0xFF0F766E);
  static const Color themeMoonColor = Color(0xFFF59E0B);

  // Quit Confirmation Dialog
  static const Color quitDialogOverlay = Color(0x66000000);
  static const Color quitDialogBackground = Color(0xFFFFFFFF);
  static const Color quitDialogTitle = Color(0xFF132238);
  static const Color quitDialogSubtitle = Color(0xFF556882);
  static const Color quitKeepPlayingBorder = Color(0xFFCCE8E1);
  static const Color quitKeepPlayingText = Color(0xFF134E4A);
  static const Color quitKeepPlayingBackground = Color(0xFFFFFFFF);
  static const Color quitConfirmButton = Color(0xFFD96B64);
  static const Color quitConfirmButtonDark = Color(0xFFC75B54);

  // Result & Lesson Completed Screen
  static const Color resultCheckmarkCircle = Color(0xFF289669);
  static const Color resultCheckmarkCircleBg = Color(0xFFECFDF5);
  static const Color resultLessonCompletedText = Color(0xFF16A34A);
  static const Color resultStatBorder = Color(0xFF86EFAC);
  static const Color resultStatBorderInactive = Color(0xFFE2E8F0);
  static const Color resultStatTextHighlight = Color(0xFF134E4A);
  static const Color resultStatSubtitleHighlight = Color(0xFF16A34A);
  static const Color resultSlippedCardBg = Color(0xFFE8F5EE);
  static const Color resultSlippedCardBorder = Color(0xFFE2E8F0);

  // Match Pairs Screen
  static const Color matchPairCardBorder = Color(0xFF86EFAC);
  static const Color matchPairCardSelectedBorder = Color(0xFF22C55E);
  static const Color matchPairCardMatchedBg = Color(0xFFF0FDF4);
  static const Color matchPairCardMatchedBorder = Color(0xFF86EFAC);
}
