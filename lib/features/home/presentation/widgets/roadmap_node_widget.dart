import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/features/home/data/models/roadmap_node_model.dart';

/// Renders the milestone circular icon with halos, borders, and concentric rings.
class RoadmapNodeWidget extends StatelessWidget {
  final RoadmapNodeModel node;
  final VoidCallback? onTap;

  const RoadmapNodeWidget({
    super.key,
    required this.node,
    this.onTap,
  });

  /// Standard diameter of each milestone circle
  static double getNodeSize(RoadmapNodeType type) {
    switch (type) {
      case RoadmapNodeType.active:
        return 68.0;
      case RoadmapNodeType.locked:
        return 54.0;
      case RoadmapNodeType.completed:
      case RoadmapNodeType.test:
        return 58.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    switch (node.type) {
      case RoadmapNodeType.completed:
        content = _buildCompletedNode();
        break;
      case RoadmapNodeType.active:
        content = _buildActiveNode();
        break;
      case RoadmapNodeType.test:
        content = _buildTestNode();
        break;
      case RoadmapNodeType.locked:
        content = _buildLockedNode();
        break;
    }

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: content,
    );
  }

  Widget _buildCompletedNode() {
    return Container(
      width: 58,
      height: 58,
      decoration: const BoxDecoration(
        color: AppColors.completedNodeHalo,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.completedNodeGreen,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check_rounded,
          color: AppColors.textWhite,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildActiveNode() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        color: AppColors.activeNodeHalo,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.activeNodeOuterRing,
          width: 2.5,
        ),
      ),
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.activeNodeBlue,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.star_border_rounded,
          color: AppColors.textWhite,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildTestNode() {
    return Container(
      width: 58,
      height: 58,
      decoration: const BoxDecoration(
        color: AppColors.testNodeHalo,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.testNodeAmber,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Text(
            '?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: AppColors.testIconDark,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLockedNode() {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: AppColors.lockedNodeBackground,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.lockedNodeBorder,
          width: 2,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.hourglass_bottom_rounded,
          color: AppColors.lockedNodeIcon,
          size: 24,
        ),
      ),
    );
  }
}
