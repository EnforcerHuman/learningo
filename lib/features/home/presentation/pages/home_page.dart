import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/responsive_utils.dart';
import 'package:learningo/core/di/injection_container.dart';
import 'package:learningo/features/home/data/models/roadmap_node_model.dart';
import 'package:learningo/features/home/domain/entites/chapter_entity.dart';
import 'package:learningo/features/home/domain/entites/unit_progress_entity.dart';
import 'package:learningo/features/home/presentation/bloc/home_bloc.dart';
import 'package:learningo/features/home/presentation/bloc/home_event.dart';
import 'package:learningo/features/home/presentation/bloc/home_state.dart';
import 'package:learningo/features/chapters/presentation/pages/unit_detail_page.dart';
import 'package:learningo/features/home/presentation/widgets/chapter_banner_widget.dart';
import 'package:learningo/features/home/presentation/widgets/header_card_widget.dart';
import 'package:learningo/features/home/presentation/widgets/roadmap_floating_actions.dart';
import 'package:learningo/features/home/presentation/widgets/roadmap_timeline_widget.dart';

/// The primary Home page showing the learning roadmap and chapter progress loaded via [HomeBloc].
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(const LoadHomeDataEvent()),
      child: const _HomePageView(),
    );
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView();

  List<RoadmapNodeModel> _buildMilestones(
    ChapterEntity chapter,
    Map<String, UnitProgressEntity> progressMap,
  ) {
    final milestones = <RoadmapNodeModel>[];
    final units = chapter.units;

    for (int i = 0; i < units.length; i++) {
      final unit = units[i];
      final isLeft = (milestones.length % 2 == 0);
      final unitProgress = progressMap[unit] ?? progressMap['$i'];

      if (unitProgress != null) {
        if (unitProgress.isCompleted || unitProgress.progress >= 1.0) {
          milestones.add(
            RoadmapNodeModel(
              id: 'unit_${chapter.id}_$i',
              title: unit,
              statusText: unitProgress.masteryStatusText,
              type: RoadmapNodeType.completed,
              alignment: isLeft ? NodeAlignment.left : NodeAlignment.right,
            ),
          );
        } else if (unitProgress.isActive) {
          milestones.add(
            RoadmapNodeModel(
              id: 'unit_${chapter.id}_$i',
              title: unit,
              statusText: unitProgress.masteryStatusText,
              badgeText: 'CONTINUE',
              type: RoadmapNodeType.active,
              alignment: isLeft ? NodeAlignment.left : NodeAlignment.right,
            ),
          );

          // Milestone Test after the active unit
          final testIsLeft = (milestones.length % 2 == 0);
          milestones.add(
            RoadmapNodeModel(
              id: 'test_${chapter.id}',
              title: '${units[0]} to $unit',
              statusText: '10 questions',
              badgeText: 'TEST • ${chapter.index}.1–${chapter.index}.${i + 1}',
              type: RoadmapNodeType.test,
              alignment: testIsLeft ? NodeAlignment.left : NodeAlignment.right,
              starCount: 3,
            ),
          );
        } else {
          milestones.add(
            RoadmapNodeModel(
              id: 'unit_${chapter.id}_$i',
              title: unit,
              statusText: unitProgress.masteryStatusText,
              type: RoadmapNodeType.locked,
              alignment: isLeft ? NodeAlignment.left : NodeAlignment.right,
            ),
          );
        }
      } else {
        milestones.add(
          RoadmapNodeModel(
            id: 'unit_${chapter.id}_$i',
            title: unit,
            statusText: '${10 + (i % 5)} Concepts',
            type: RoadmapNodeType.locked,
            alignment: isLeft ? NodeAlignment.left : NodeAlignment.right,
          ),
        );
      }
    }

    return milestones;
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.headerBackground,
              ),
            );
          }

          final currentChapter = state is HomeDataLoadedState
              ? state.currentChapter
              : null;

          final chapterNumber = currentChapter != null
              ? 'CHAPTER ${currentChapter.index}'
              : 'CHAPTER 1';

          final chapterTitle = currentChapter != null
              ? (currentChapter.id == 1 ? 'Important Days' : currentChapter.nameEn)
              : 'Important Days';

          final milestones = (currentChapter != null && state is HomeDataLoadedState)
              ? _buildMilestones(currentChapter, state.unitProgressMap)
              : const <RoadmapNodeModel>[];

          return Stack(
            children: [
              // Scrollable main content
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Top vibrant pink header
                        HeaderCardWidget(
                          progressSubtitle: state is HomeDataLoadedState
                              ? state.progressSubtitle
                              : '0/12 units complete',
                          percentageText: state is HomeDataLoadedState
                              ? state.completionPercentageText
                              : '0%',
                          onSyllabusTap: () {
                            // Syllabus tap
                          },
                          onExamTap: (exam) {
                            // Exam filter tap
                          },
                        ),

                        const SizedBox(height: 14),

                        // Indigo chapter banner
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ChapterBannerWidget(
                            chapterNumber: chapterNumber,
                            chapterTitle: chapterTitle,
                            onMenuTap: () {
                              // Chapter menu tap
                            },
                          ),
                        ),

                        // Roadmap path and milestones loaded dynamically from BLoC
                        if (milestones.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: responsive.scale(12),
                            ),
                            child: RoadmapTimelineWidget(
                              nodes: milestones,
                              onNodeTap: (node) {
                                final homeBloc = context.read<HomeBloc>();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BlocProvider.value(
                                      value: homeBloc,
                                      child: UnitDetailPage(
                                        unitId: 2,
                                        monthName: node.title,
                                        homeBloc: homeBloc,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                        // Extra bottom spacing for floating buttons and safe scroll
                        const SizedBox(height: 70),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom right floating action buttons
              Positioned(
                right: 18,
                bottom: 30,
                child: RoadmapFloatingActions(
                  onLanguageTap: () {
                    // Toggle language
                  },
                  onThemeTap: () {
                    // Toggle theme
                  },
                ),
              ),

              // Bottom home indicator bar
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 44,
                    height: 4.5,
                    decoration: BoxDecoration(
                      color: AppColors.homeIndicator,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
