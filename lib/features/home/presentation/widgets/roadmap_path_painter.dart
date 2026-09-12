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
    // Start slightly above the first node point
    final first = points.first;
    path.moveTo(first.dx - 20, 0);

    // Initial curve into the first point
    path.cubicTo(
      first.dx - 15,
      first.dy * 0.4,
      first.dx - 5,
      first.dy * 0.7,
      first.dx,
      first.dy,
    );

    // Smooth cubic bezier curves connecting successive node centers
    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];

      final midY = (p0.dy + p1.dy) / 2;

      path.cubicTo(
        p0.dx,
        midY,
        p1.dx,
        midY,
        p1.dx,
        p1.dy,
      );
    }

    // Continue smoothly past the last milestone node
    final last = points.last;
    path.cubicTo(
      last.dx,
      last.dy + 35,
      last.dx + 20,
      last.dy + 55,
      last.dx + 30,
      last.dy + 75,
    );

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
