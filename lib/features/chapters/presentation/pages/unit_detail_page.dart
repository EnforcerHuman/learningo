import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/responsive_utils.dart';
import 'package:learningo/core/di/injection_container.dart';
import 'package:learningo/features/chapters/presentation/bloc/unit_detail_bloc.dart';
import 'package:learningo/features/chapters/presentation/bloc/unit_detail_event.dart';
import 'package:learningo/features/chapters/presentation/bloc/unit_detail_state.dart';
import 'package:learningo/features/chapters/presentation/pages/question_page.dart';
import 'package:learningo/features/chapters/presentation/widgets/unit_bottom_button.dart';
import 'package:learningo/features/chapters/presentation/widgets/unit_community_badge.dart';
import 'package:learningo/features/chapters/presentation/widgets/unit_header_card.dart';
import 'package:learningo/features/chapters/presentation/widgets/unit_metrics_row.dart';
import 'package:learningo/features/chapters/presentation/widgets/unit_topics_list.dart';
import 'package:learningo/features/chapters/presentation/widgets/unit_view_toggle.dart';
import 'package:learningo/features/home/presentation/bloc/home_bloc.dart';

/// Screen displaying the topics and detail of a specific chapter unit.
class UnitDetailPage extends StatelessWidget {
  final int unitId;
  final String? monthName;
  final HomeBloc? homeBloc;

  const UnitDetailPage({
    super.key,
    this.unitId = 2,
    this.monthName,
    this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UnitDetailBloc>()..add(LoadUnitDetailEvent(unitId: unitId)),
      child: _UnitDetailPageView(
        monthName: monthName,
        homeBloc: homeBloc,
      ),
    );
  }
}

class _UnitDetailPageView extends StatelessWidget {
  final String? monthName;
  final HomeBloc? homeBloc;

  const _UnitDetailPageView({
    this.monthName,
    this.homeBloc,
  });

  void _navigateToQuestionPage(BuildContext context, int unitNumber, String unitTitle) {
    HomeBloc? targetHomeBloc = homeBloc;
    try {
      targetHomeBloc ??= context.read<HomeBloc>();
    } catch (_) {}

    final resolvedMonth = monthName ?? unitTitle;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => targetHomeBloc != null
            ? BlocProvider.value(
                value: targetHomeBloc,
                child: QuestionPage(
                  unitId: unitNumber,
                  monthName: resolvedMonth,
                  homeBloc: targetHomeBloc,
                ),
              )
            : QuestionPage(
                unitId: unitNumber,
                monthName: resolvedMonth,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<UnitDetailBloc, UnitDetailState>(
          builder: (context, state) {
            if (state is UnitDetailLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.unitGradientStart,
                ),
              );
            }

            if (state is! UnitDetailLoadedState) {
              return const SizedBox.shrink();
            }

            final detail = state.unitDetail;

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  children: [
                    // Top App Bar with Circular Back Button
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                      child: Row(
                        children: [
                          _buildBackButton(context),
                        ],
                      ),
                    ),

                    // Scrollable Main Content
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.scale(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Emerald Unit Header Card
                            UnitHeaderCard(
                              unitNumber: detail.unitNumber,
                              chapterTitle: detail.chapterTitle,
                              unitTitle: detail.unitTitle,
                            ),

                            const SizedBox(height: 14),

                            // Concepts & Questions Metrics Row
                            UnitMetricsRow(
                              conceptsCount: detail.conceptsCount,
                              questionsCount: detail.questionsCount,
                            ),

                            const SizedBox(height: 16),

                            // View Toggle (Index / Tiles)
                            UnitViewToggle(
                              totalCount: detail.topics.length,
                              isIndexView: state.isIndexView,
                              onToggleView: (isIndex) {
                                context.read<UnitDetailBloc>().add(
                                      ToggleViewModeEvent(isIndexView: isIndex),
                                    );
                              },
                            ),

                            const SizedBox(height: 12),

                            // Topics List Container
                            UnitTopicsList(
                              topics: detail.topics,
                              onTopicTap: (topic) {
                                _navigateToQuestionPage(
                                  context,
                                  detail.unitNumber,
                                  detail.unitTitle,
                                );
                              },
                            ),

                            const SizedBox(height: 14),

                            // Community Completion Badge
                            UnitCommunityBadge(
                              text: detail.completionText,
                            ),

                            // Extra bottom padding for sticky button clearance
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),

                    // Bottom Sticky Action Area
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                      decoration: const BoxDecoration(
                        color: AppColors.screenBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UnitBottomButton(
                            onPressed: () {
                              _navigateToQuestionPage(
                                context,
                                detail.unitNumber,
                                detail.unitTitle,
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          // Bottom Home Indicator
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
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.backButtonBackground,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.backButtonBorder,
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.chevron_left_rounded,
              color: AppColors.backButtonIcon,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
