import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';

/// Stat cards row displaying the number of concepts and questions in a unit.
class UnitMetricsRow extends StatelessWidget {
  final int conceptsCount;
  final int questionsCount;

  const UnitMetricsRow({
    super.key,
    required this.conceptsCount,
    required this.questionsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildMetricCard(
            count: conceptsCount,
            label: 'CONCEPTS',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildMetricCard(
            count: questionsCount,
            label: 'QUESTIONS',
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required int count,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.statCardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.statCardBorder,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppColors.statNumberGreen,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: AppColors.statLabelGrey,
                letterSpacing: 0.5,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
