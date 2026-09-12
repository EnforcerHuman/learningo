import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/app_typography.dart';
import 'package:learningo/features/home/data/models/roadmap_node_model.dart';

/// Renders the title, optional badge, and status pill for a milestone.
class RoadmapNodeInfoWidget extends StatelessWidget {
  final RoadmapNodeModel node;
  final bool isNodeOnLeft;
  final VoidCallback? onTap;

  const RoadmapNodeInfoWidget({
    super.key,
    required this.node,
    required this.isNodeOnLeft,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final align = isNodeOnLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final textAlign = isNodeOnLeft ? TextAlign.left : TextAlign.right;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: align,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (node.badgeText != null) ...[
            _buildBadge(node.badgeText!, node.type),
            const SizedBox(height: 5),
          ],
          Text(
            node.title,
            style: AppTypography.nodeTitle,
            textAlign: textAlign,
          ),
          const SizedBox(height: 3),
          _buildStatusPill(node.statusText, node.type),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, RoadmapNodeType type) {
    Color bg;
    Color textColor;

    switch (type) {
      case RoadmapNodeType.active:
        bg = AppColors.continueBadgeBackground;
        textColor = AppColors.continueBadgeText;
        break;
      case RoadmapNodeType.test:
        bg = AppColors.testBadgeBackground;
        textColor = AppColors.testBadgeText;
        break;
      default:
        bg = AppColors.upcomingBadgeBackground;
        textColor = AppColors.upcomingBadgeText;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: AppTypography.badgeSmall.copyWith(color: textColor),
      ),
    );
  }

  Widget _buildStatusPill(String text, RoadmapNodeType type) {
    Color bg;
    Color textColor;
    Border? border;

    if (text.contains('mastered')) {
      bg = AppColors.masteredBadgeBackground;
      textColor = AppColors.masteredBadgeText;
      border = Border.all(color: AppColors.masteredBadgeBorder, width: 1.0);
    } else {
      switch (type) {
        case RoadmapNodeType.completed:
          bg = AppColors.masteredBadgeBackground;
          textColor = AppColors.masteredBadgeText;
          border = Border.all(color: AppColors.masteredBadgeBorder, width: 1.0);
          break;
        case RoadmapNodeType.active:
          bg = AppColors.conceptsBadgeBackground;
          textColor = AppColors.conceptsBadgeText;
          break;
        case RoadmapNodeType.test:
          bg = AppColors.testQuestionsBadgeBackground;
          textColor = AppColors.testQuestionsBadgeText;
          break;
        case RoadmapNodeType.locked:
          bg = AppColors.upcomingBadgeBackground;
          textColor = AppColors.upcomingBadgeText;
          break;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        border: border,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: AppTypography.statusPill.copyWith(color: textColor),
      ),
    );
  }
}
