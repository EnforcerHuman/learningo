import 'package:flutter/material.dart';

/// Responsive utility helpers to adapt dimensions smoothly across different screen widths.
class ResponsiveUtils {
  final BuildContext context;
  late final double screenWidth;
  late final double screenHeight;

  ResponsiveUtils(this.context) {
    final size = MediaQuery.sizeOf(context);
    screenWidth = size.width;
    screenHeight = size.height;
  }

  /// Scale factor based on standard mobile width of 390dp
  double get scaleFactor => (screenWidth / 390.0).clamp(0.85, 1.25);

  /// Scales a numeric size based on screen width
  double scale(double size) => size * scaleFactor;

  /// Scales font size based on screen width
  double font(double size) => size * scaleFactor;

  /// Clamps horizontal padding for responsiveness on wide screens / tablets
  double get horizontalPadding {
    if (screenWidth > 600) {
      return (screenWidth - 420) / 2;
    }
    return 16.0;
  }
}
