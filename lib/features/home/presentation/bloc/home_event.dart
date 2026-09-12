import 'package:flutter/foundation.dart';

/// Events for [HomeBloc].
@immutable
sealed class HomeEvent {
  const HomeEvent();
}

/// Event to trigger loading home data.
final class LoadHomeDataEvent extends HomeEvent {
  const LoadHomeDataEvent();
}

/// Event to update progress for a specific month / unit.
final class UpdateMonthProgressEvent extends HomeEvent {
  final int? unitIndex;
  final String? unitName;
  final double? progress;
  final bool? isCompleted;
  final bool? isActive;
  final int? conceptsCount;
  final int? completedConcepts;
  final int? lastQuestionIndex;

  const UpdateMonthProgressEvent({
    this.unitIndex,
    this.unitName,
    this.progress,
    this.isCompleted,
    this.isActive,
    this.conceptsCount,
    this.completedConcepts,
    this.lastQuestionIndex,
  });
}
