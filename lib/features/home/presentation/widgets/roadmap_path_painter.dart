import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';

/// Custom painter that draws a smooth dashed bezier curve connecting milestone nodes.
class RoadmapPathPainter extends CustomPainter {
  final List<Offset> points;

  const RoadmapPathPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final paint = Paint()
      ..color = AppColors.roadmapPath
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final first = points.first;
    // Start straight down into the first milestone node
    path.moveTo(first.dx, 0);
    path.lineTo(first.dx, first.dy);

    // Smooth bezier curves connecting successive node centers
    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];

      // Maintain vertical line past info widget height (p0.dy + 38)
      final yStartCurve = p0.dy + 38.0;
      final yEndCurve = p1.dy - 38.0;
      final midY = (p0.dy + p1.dy) / 2;

      path.lineTo(p0.dx, yStartCurve);
      path.cubicTo(
        p0.dx,
        midY,
        p1.dx,
        midY,
        p1.dx,
        yEndCurve,
      );
      path.lineTo(p1.dx, p1.dy);
    }

    // Continue straight down past the last milestone node
    final last = points.last;
    path.lineTo(last.dx, last.dy + 50);

    _drawDashedPath(canvas, path, paint, dashWidth: 7.0, dashSpace: 5.5);
  }

  void _drawDashedPath(
    Canvas canvas,
    Path source,
    Paint paint, {
    required double dashWidth,
    required double dashSpace,
  }) {
    for (final metric in source.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final length = (distance + dashWidth < metric.length)
            ? dashWidth
            : metric.length - distance;
        final extract = metric.extractPath(distance, distance + length);
        canvas.drawPath(extract, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant RoadmapPathPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}
