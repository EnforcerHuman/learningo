import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/app_typography.dart';

/// Top header card featuring the subject title, progress pill, syllabus button,
/// and horizontal list of exam tags.
class HeaderCardWidget extends StatelessWidget {
  final String progressSubtitle;
  final String percentageText;
  final VoidCallback? onSyllabusTap;
  final ValueChanged<String>? onExamTap;

  const HeaderCardWidget({
    super.key,
    this.progressSubtitle = '0/12 units complete',
    this.percentageText = '0%',
    this.onSyllabusTap,
    this.onExamTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.headerBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTopInfoRow(),
              const SizedBox(height: 16),
              _buildWillHelpSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopInfoRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Target bullseye badge
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.headerTargetBadge,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Center(
            child: Icon(
              Icons.track_changes_rounded,
              color: AppColors.headerTargetIcon,
              size: 26,
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Title and progress
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Static GK',
                style: AppTypography.headerTitle,
              ),
              const SizedBox(height: 3),
              Wrap(
                spacing: 6,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    progressSubtitle,
                    style: AppTypography.headerSubtitle,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.headerPercentagePill,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      percentageText,
                      style: AppTypography.headerPercentage,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Syllabus button
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onSyllabusTap,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.headerSyllabusButton,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.menu_rounded,
                    color: AppColors.textWhite,
                    size: 18,
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Syllabus',
                    style: AppTypography.syllabusButtonText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWillHelpSection() {
    return Row(
      children: [
        const Text(
          'WILL\nHELP',
          style: AppTypography.willHelpLabel,
        ),
        const SizedBox(width: 14),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                _buildExamChip(
                  label: 'RRB',
                  icon: Icons.train_rounded,
                ),
                const SizedBox(width: 8),
                _buildExamChip(
                  label: 'SSC',
                  icon: Icons.shield_rounded,
                ),
                const SizedBox(width: 8),
                _buildExamChip(
                  label: 'State PSC',
                  icon: null,
                ),
                const SizedBox(width: 8),
                _buildExamChip(
                  label: 'Police',
                  icon: Icons.local_police_rounded,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExamChip({
    required String label,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.headerChipBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.headerChipBorder,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: AppColors.headerChipBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.textWhite,
                size: 12,
              ),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: AppTypography.examChipText,
          ),
        ],
      ),
    );
  }
}
