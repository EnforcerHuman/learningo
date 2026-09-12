import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/features/home/data/models/roadmap_node_model.dart';
import 'package:learningo/features/home/presentation/widgets/roadmap_node_info_widget.dart';
import 'package:learningo/features/home/presentation/widgets/roadmap_node_widget.dart';
import 'package:learningo/features/home/presentation/widgets/roadmap_path_painter.dart';

/// Container that orchestrates all roadmap milestones along a smooth dashed path.
/// Guarantees that milestone circles are placed with absolute mathematical precision
/// directly on the center of the road path.
class RoadmapTimelineWidget extends StatelessWidget {
  final List<RoadmapNodeModel> nodes;
  final ValueChanged<RoadmapNodeModel>? onNodeTap;

  const RoadmapTimelineWidget({
    super.key,
    required this.nodes,
    this.onNodeTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        // Exact horizontal centers for alternating milestone nodes
        final leftCenter = totalWidth * 0.28;
        final rightCenter = totalWidth * 0.72;

        // Vertical spacing between milestone centers
        const rowSpacing = 118.0;
        const topPadding = 24.0;

        // Exact coordinates where the road path and circles intersect
        final points = <Offset>[];
        for (int i = 0; i < nodes.length; i++) {
          final isLeft = nodes[i].alignment == NodeAlignment.left;
          final x = isLeft ? leftCenter : rightCenter;
          final y = topPadding + (i * rowSpacing) + 35.0;
          points.add(Offset(x, y));
        }

        final totalHeight = topPadding + (nodes.length * rowSpacing) + 50.0;

        return SizedBox(
          width: totalWidth,
          height: totalHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Dashed connecting bezier curve path passing through points
              Positioned.fill(
                child: CustomPaint(
                  painter: RoadmapPathPainter(points: points),
                ),
              ),

              // Milestone nodes placed exactly at (point.dx, point.dy)
              for (int i = 0; i < nodes.length; i++) ...[
                _buildMilestoneItem(
                  node: nodes[i],
                  point: points[i],
                  totalWidth: totalWidth,
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildMilestoneItem({
    required RoadmapNodeModel node,
    required Offset point,
    required double totalWidth,
  }) {
    final isLeft = node.alignment == NodeAlignment.left;
    final nodeSize = RoadmapNodeWidget.getNodeSize(node.type);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 1. Circle is positioned exactly on the road center
        Positioned(
          left: point.dx - (nodeSize / 2),
          top: point.dy - (nodeSize / 2),
          width: nodeSize,
          height: nodeSize,
          child: RoadmapNodeWidget(
            node: node,
            onTap: () => onNodeTap?.call(node),
          ),
        ),

        // 2. Star accessories for test node (positioned beneath circle)
        if (node.type == RoadmapNodeType.test)
          Positioned(
            left: point.dx - 30,
            top: point.dy + (nodeSize / 2) + 3,
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.5),
                  child: Icon(
                    Icons.star_rounded,
                    color: AppColors.starInactive,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),

        // 3. Info labels & badges vertically aligned with the circle center
        Positioned(
          left: isLeft ? point.dx + (nodeSize / 2) + 16 : 16,
          right: isLeft ? 16 : totalWidth - (point.dx - (nodeSize / 2) - 16),
          top: point.dy - 30,
          child: RoadmapNodeInfoWidget(
            node: node,
            isNodeOnLeft: isLeft,
            onTap: () => onNodeTap?.call(node),
          ),
        ),
      ],
    );
  }
}
