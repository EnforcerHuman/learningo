import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';

/// Segmented view switcher for switching between Index list view and Tiles grid view.
class UnitViewToggle extends StatelessWidget {
  final int totalCount;
  final bool isIndexView;
  final ValueChanged<bool>? onToggleView;

  const UnitViewToggle({
    super.key,
    required this.totalCount,
    required this.isIndexView,
    this.onToggleView,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "WHAT YOU'LL LEARN",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: AppColors.textSecondary,
                letterSpacing: 1.0,
              ),
            ),
            Text(
              '$totalCount',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: AppColors.statNumberGreen,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Toggle Switch Buttons
        Row(
          children: [
            Expanded(
              child: _buildToggleButton(
                label: 'INDEX',
                icon: Icons.description_outlined,
                isActive: isIndexView,
                onTap: () => onToggleView?.call(true),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildToggleButton(
                label: 'TILES',
                icon: Icons.grid_view_rounded,
                isActive: !isIndexView,
                onTap: () => onToggleView?.call(false),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildToggleButton({
    required String label,
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.toggleActiveBackground
                : AppColors.toggleInactiveBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isActive
                  ? AppColors.toggleActiveBorder
                  : AppColors.toggleInactiveBorder,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: isActive
                    ? AppColors.toggleActiveText
                    : AppColors.toggleInactiveText,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: isActive
                      ? AppColors.toggleActiveText
                      : AppColors.toggleInactiveText,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
