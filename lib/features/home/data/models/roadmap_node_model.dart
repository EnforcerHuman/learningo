import 'package:flutter/material.dart';

/// Enum representing the state/type of a roadmap milestone node.
enum RoadmapNodeType {
  completed,
  active,
  test,
  locked,
}

/// Alignment side for the milestone icon relative to its label.
enum NodeAlignment {
  left,
  right,
}

/// Model for milestone nodes on the learning roadmap.
class RoadmapNodeModel {
  final String id;
  final String title;
  final String statusText;
  final String? badgeText;
  final RoadmapNodeType type;
  final NodeAlignment alignment;
  final int? starCount;
  final IconData? customIcon;

  const RoadmapNodeModel({
    required this.id,
    required this.title,
    required this.statusText,
    this.badgeText,
    required this.type,
    required this.alignment,
    this.starCount,
    this.customIcon,
  });
}
