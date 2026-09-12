import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/responsive_utils.dart';
import 'package:learningo/features/chapters/domain/entites/slipped_concept_entity.dart';
import 'package:learningo/features/chapters/presentation/widgets/result_slipped_card.dart';
import 'package:learningo/features/chapters/presentation/widgets/result_stat_card.dart';

/// Screen displayed upon lesson completion showing accuracy, time metrics, and review cards.
class ResultPage extends StatelessWidget {
  final String monthName;
  final int accuracyPercentage;
  final String yourTime;
  final String classAverageTime;
  final List<SlippedConceptEntity> slippedConcepts;
  final VoidCallback? onContinue;
  final VoidCallback? onBack;

  const ResultPage({
    super.key,
    this.monthName = 'January',
    this.accuracyPercentage = 36,
    this.yourTime = '15m 45s',
    this.classAverageTime = '5m 10s',
    this.slippedConcepts = const [
      SlippedConceptEntity(title: 'World Hindi Day'),
      SlippedConceptEntity(title: 'Army Day'),
      SlippedConceptEntity(title: 'Pravasi Bharatiya Divas'),
    ],
    this.onContinue,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              children: [
                // Top Navigation Bar
                _buildTopBar(context),

                // Main Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: responsive.scale(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: responsive.scale(32)),

                        // Big Success Checkmark Badge
                        _buildCheckmarkBadge(responsive),
                        SizedBox(height: responsive.scale(16)),

                        // "LESSON COMPLETED" Subtitle
                        Text(
                          'LESSON COMPLETED',
                          style: TextStyle(
                            fontSize: responsive.font(13),
                            fontWeight: FontWeight.w800,
                            color: AppColors.resultLessonCompletedText,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: responsive.scale(6)),

                        // Month Name Header (e.g. "January")
                        Text(
                          monthName,
                          style: TextStyle(
                            fontSize: responsive.font(28),
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(height: responsive.scale(24)),

                        // 3 Metrics Stat Cards Row
                        Row(
                          children: [
                            ResultStatCard(
                              value: '$accuracyPercentage%',
                              label: 'Accuracy',
                              isHighlighted: true,
                            ),
                            SizedBox(width: responsive.scale(10)),
                            ResultStatCard(
                              value: yourTime,
                              label: 'Your time',
                              isHighlighted: true,
                            ),
                            SizedBox(width: responsive.scale(10)),
                            ResultStatCard(
                              value: classAverageTime,
                              label: 'Class average',
                              isHighlighted: false,
                            ),
                          ],
                        ),
                        SizedBox(height: responsive.scale(28)),

                        // "WHERE YOU SLIPPED" Section
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'WHERE YOU SLIPPED',
                            style: TextStyle(
                              fontSize: responsive.font(12),
                              fontWeight: FontWeight.w800,
                              color: AppColors.textSecondary,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        SizedBox(height: responsive.scale(12)),

                        // Horizontal Slipped Carousel
                        SizedBox(
                          height: responsive.scale(150),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: slippedConcepts.length,
                            itemBuilder: (context, index) {
                              return ResultSlippedCard(
                                concept: slippedConcepts[index],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: responsive.scale(20)),
                      ],
                    ),
                  ),
                ),

                // Bottom Sticky Continue Button
                _buildBottomButtonArea(context, responsive),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: onBack ??
                  () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
              borderRadius: BorderRadius.circular(20),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 22,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          const Text(
            'Result',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckmarkBadge(ResponsiveUtils responsive) {
    return Container(
      width: responsive.scale(64),
      height: responsive.scale(64),
      decoration: BoxDecoration(
        color: AppColors.resultCheckmarkCircleBg,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.resultCheckmarkCircle,
          width: 3.5,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.check_rounded,
          color: AppColors.resultCheckmarkCircle,
          size: 38,
        ),
      ),
    );
  }

  Widget _buildBottomButtonArea(
    BuildContext context,
    ResponsiveUtils responsive,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
      decoration: const BoxDecoration(
        color: AppColors.screenBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: responsive.scale(54),
            decoration: BoxDecoration(
              color: AppColors.unitGradientStart,
              borderRadius: BorderRadius.circular(28),
            ),
            child: InkWell(
              onTap: onContinue ??
                  () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
              borderRadius: BorderRadius.circular(28),
              child: const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textWhite,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 18,
                      color: AppColors.textWhite,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 44,
            height: 4.5,
            decoration: BoxDecoration(
              color: AppColors.homeIndicator,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }
}
