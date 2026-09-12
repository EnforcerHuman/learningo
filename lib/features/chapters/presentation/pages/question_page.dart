import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/responsive_utils.dart';
import 'package:learningo/core/di/injection_container.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_bloc.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_event.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_state.dart';
import 'package:learningo/features/chapters/presentation/widgets/question_bottom_bar.dart';
import 'package:learningo/features/chapters/presentation/widgets/question_content_dispatcher.dart';
import 'package:learningo/features/chapters/presentation/widgets/question_feedback_card.dart';
import 'package:learningo/features/chapters/presentation/widgets/question_mascot_widget.dart';
import 'package:learningo/features/chapters/presentation/widgets/question_top_bar.dart';
import 'package:learningo/features/chapters/presentation/widgets/quit_confirmation_dialog.dart';
import 'package:learningo/features/chapters/presentation/pages/result_page.dart';
import 'package:learningo/features/home/presentation/bloc/home_bloc.dart';
import 'package:learningo/features/home/presentation/bloc/home_event.dart';
import 'package:learningo/features/home/presentation/bloc/home_state.dart';

/// Primary screen orchestrating interactive question sessions and learning content.
class QuestionPage extends StatelessWidget {
  final int unitId;
  final String? monthName;
  final HomeBloc? homeBloc;
  final QuestionBloc? questionBloc;

  const QuestionPage({
    super.key,
    this.unitId = 2,
    this.monthName,
    this.homeBloc,
    this.questionBloc,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedMonth = monthName ?? 'January';
    int savedIndex = 0;
    HomeBloc? targetHomeBloc = homeBloc;
    try {
      targetHomeBloc ??= context.read<HomeBloc>();
    } catch (_) {}
    if (targetHomeBloc != null && targetHomeBloc.state is HomeDataLoadedState) {
      final s = targetHomeBloc.state as HomeDataLoadedState;
      savedIndex = s.unitProgressMap[resolvedMonth]?.lastQuestionIndex ?? 0;
    }

    if (questionBloc != null) {
      return BlocProvider.value(
        value: questionBloc!,
        child: _QuestionPageView(monthName: resolvedMonth, homeBloc: targetHomeBloc),
      );
    }

    return BlocProvider(
      create: (context) => sl<QuestionBloc>()
        ..add(LoadQuestionsEvent(unitId: unitId, initialIndex: savedIndex)),
      child: _QuestionPageView(monthName: resolvedMonth, homeBloc: targetHomeBloc),
    );
  }
}

class _QuestionPageView extends StatelessWidget {
  final String monthName;
  final HomeBloc? homeBloc;

  const _QuestionPageView({
    required this.monthName,
    this.homeBloc,
  });

  void _updateHomeProgress(BuildContext context, QuestionActiveState state) {
    HomeBloc? targetHomeBloc = homeBloc;
    try {
      targetHomeBloc ??= context.read<HomeBloc>();
    } catch (_) {}
    if (targetHomeBloc == null || state.totalCount <= 0) return;

    int totalConcepts = 10;
    final homeState = targetHomeBloc.state;
    if (homeState is HomeDataLoadedState) {
      final up = homeState.unitProgressMap[monthName];
      if (up?.conceptsCount != null && up!.conceptsCount! > 0) {
        totalConcepts = up.conceptsCount!;
      }
    }

    final completedConcepts = _getCompletedConceptsCount(state);
    final progress = (completedConcepts / totalConcepts).clamp(0.0, 1.0);
    final isDone = progress >= 1.0;

    targetHomeBloc.add(UpdateMonthProgressEvent(
      unitName: monthName,
      progress: progress,
      completedConcepts: completedConcepts,
      lastQuestionIndex: state.currentIndex,
      isCompleted: isDone,
      isActive: !isDone,
    ));
  }

  int _getCompletedConceptsCount(QuestionActiveState state) {
    if (state.questions.isEmpty) return 0;
    final hasLearnSlides =
        state.questions.any((q) => q.type == QuestionType.learn);
    if (hasLearnSlides) {
      return ((state.currentIndex + 1) / 2).floor();
    } else {
      return state.currentIndex + 1;
    }
  }

  Future<void> _handleExit(
    BuildContext context,
    QuestionActiveState? state,
  ) async {
    final completed = state?.currentIndex ?? 0;
    final total = state?.totalCount ?? 0;
    final shouldQuit = await QuitConfirmationDialog.show(
      context,
      completedCount: completed,
      totalCount: total,
    );
    if (shouldQuit == true && context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocListener<QuestionBloc, QuestionState>(
      listener: (context, state) {
        if (state is QuestionActiveState) {
          if (state.isEvaluated ||
              state.currentQuestion.type == QuestionType.learn) {
            _updateHomeProgress(context, state);
          }
        }
      },
      child: BlocBuilder<QuestionBloc, QuestionState>(
        builder: (context, state) {
          final activeState = state is QuestionActiveState ? state : null;

          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              if (didPop) return;
              await _handleExit(context, activeState);
            },
            child: Scaffold(
              backgroundColor: AppColors.screenBackground,
              body: SafeArea(
                bottom: false,
                child: Builder(
                  builder: (context) {
                    if (state is QuestionLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.startButtonGreen,
                        ),
                      );
                    }

                    if (activeState == null) {
                      return const SizedBox.shrink();
                    }

                    final current = activeState.currentQuestion;

                    return Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 480),
                        child: Column(
                          children: [
                            // Top Progress & Navigation Bar
                            QuestionTopBar(
                              progress: activeState.progressFraction,
                              progressText: activeState.stepDisplay,
                              onBack: () => _handleExit(context, activeState),
                              onClose: () => _handleExit(context, activeState),
                              onMenu: () {},
                            ),

                            // Main Scrollable Interactive Question Body
                            Expanded(
                              child: Stack(
                                children: [
                                  SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: responsive.scale(16),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 8),
                                        QuestionContentDispatcher(
                                          state: activeState,
                                          question: current,
                                        ),
                                        const SizedBox(height: 40),
                                      ],
                                    ),
                                  ),

                                  // Floating Mascot Icon
                                  if (current.type != QuestionType.learn)
                                    const Positioned(
                                      right: 20,
                                      bottom: 12,
                                      child: QuestionMascotWidget(),
                                    ),
                                ],
                              ),
                            ),

                            // Bottom Action & Feedback Area
                            _buildBottomActionArea(context, activeState, current),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomActionArea(
    BuildContext context,
    QuestionActiveState activeState,
    QuestionEntity current,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
      decoration: const BoxDecoration(
        color: AppColors.screenBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (activeState.isEvaluated && current.explanation != null) ...[
            QuestionFeedbackCard(
              isCorrect: activeState.isCorrect ?? false,
              correctLabel: current.correctOptionLabel ?? '',
              explanation: current.explanation!,
            ),
            const SizedBox(height: 10),
          ],
          QuestionBottomBar(
            questionType: current.type,
            isEvaluated: activeState.isEvaluated,
            isCorrect: activeState.isCorrect ?? false,
            hasSelection: activeState.selectedOptionId != null,
            onPressed: () {
              final isAdvanceable = current.type == QuestionType.learn ||
                  current.type == QuestionType.matchPairs ||
                  activeState.isEvaluated;
              if (isAdvanceable) {
                if (activeState.isLastQuestion) {
                  _updateHomeProgress(context, activeState);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => ResultPage(monthName: monthName)));
                } else {
                  context.read<QuestionBloc>().add(const NextQuestionEvent());
                }
              } else {
                context.read<QuestionBloc>().add(const SubmitAnswerEvent());
              }
            },
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
