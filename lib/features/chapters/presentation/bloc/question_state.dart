import 'package:flutter/foundation.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';

/// States for [QuestionBloc].
@immutable
sealed class QuestionState {
  const QuestionState();
}

/// Initial state.
final class QuestionInitialState extends QuestionState {
  const QuestionInitialState();
}

/// Loading state.
final class QuestionLoadingState extends QuestionState {
  const QuestionLoadingState();
}

/// Active interactive state.
final class QuestionActiveState extends QuestionState {
  final List<QuestionEntity> questions;
  final int currentIndex;
  final String? selectedOptionId;
  final bool isEvaluated;
  final bool? isCorrect;
  final Set<String> disabledOptionIds;

  const QuestionActiveState({
    required this.questions,
    this.currentIndex = 0,
    this.selectedOptionId,
    this.isEvaluated = false,
    this.isCorrect,
    this.disabledOptionIds = const {},
  });

  QuestionEntity get currentQuestion => questions[currentIndex];
  int get totalCount => questions.length;
  bool get isLastQuestion => currentIndex >= questions.length - 1;

  /// Progress fraction calculated strictly sequentially from 1/total up to 1.0
  double get progressFraction {
    if (questions.isEmpty) return 0.0;
    return ((currentIndex + 1) / questions.length).clamp(0.05, 1.0);
  }

  /// Sequential step display (e.g. "1/17", "2/17", "3/17", ...)
  String get stepDisplay {
    if (questions.isEmpty) return '0/0';
    return '${currentIndex + 1}/${questions.length}';
  }

  QuestionActiveState copyWith({
    List<QuestionEntity>? questions,
    int? currentIndex,
    String? selectedOptionId,
    bool? isEvaluated,
    bool? isCorrect,
    Set<String>? disabledOptionIds,
  }) {
    return QuestionActiveState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedOptionId: selectedOptionId ?? this.selectedOptionId,
      isEvaluated: isEvaluated ?? this.isEvaluated,
      isCorrect: isCorrect ?? this.isCorrect,
      disabledOptionIds: disabledOptionIds ?? this.disabledOptionIds,
    );
  }
}
