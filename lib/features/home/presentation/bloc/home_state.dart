import 'package:flutter/foundation.dart';
import 'package:learningo/features/home/domain/entites/chapter_entity.dart';
import 'package:learningo/features/home/domain/entites/unit_progress_entity.dart';

/// States for [HomeBloc].
@immutable
sealed class HomeState {
  const HomeState();
}

/// Initial uninitialized state.
final class HomeInitialState extends HomeState {
  const HomeInitialState();
}

/// Loading in progress.
final class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

/// State when chapters data is loaded successfully with real-time dynamic unit progress tracking.
final class HomeDataLoadedState extends HomeState {
  final List<ChapterEntity> chapters;
  final Map<String, UnitProgressEntity> unitProgressMap;

  const HomeDataLoadedState({
    required this.chapters,
    this.unitProgressMap = const {},
  });

  ChapterEntity? get currentChapter =>
      chapters.isNotEmpty ? chapters.first : null;

  /// Retrieves progress for a unit by name or index.
  UnitProgressEntity? getProgressForUnit(String unitName, int index) {
    return unitProgressMap[unitName] ?? unitProgressMap['$index'];
  }

  /// Calculates total overall completion percentage across all units.
  double get overallCompletionPercentage {
    if (unitProgressMap.isEmpty) return 0.0;
    final totalProgress = unitProgressMap.values
        .fold<double>(0.0, (sum, unit) => sum + unit.progress);
    return (totalProgress / unitProgressMap.length).clamp(0.0, 1.0);
  }

  /// Number of units that have been fully mastered (100%).
  int get completedUnitsCount =>
      unitProgressMap.values.where((u) => u.isCompleted || u.progress >= 1.0).length;

  /// Total number of tracked syllabus units.
  int get totalUnitsCount => unitProgressMap.length;

  /// Dynamic progress subtitle (e.g. "0/12 units complete" or "2/12 units complete").
  String get progressSubtitle =>
      '$completedUnitsCount/$totalUnitsCount units complete';

  /// Formatted overall percentage text (e.g. "0%", "8%", "25%").
  String get completionPercentageText =>
      '${(overallCompletionPercentage * 100).round()}%';

  HomeDataLoadedState copyWith({
    List<ChapterEntity>? chapters,
    Map<String, UnitProgressEntity>? unitProgressMap,
  }) {
    return HomeDataLoadedState(
      chapters: chapters ?? this.chapters,
      unitProgressMap: unitProgressMap ?? this.unitProgressMap,
    );
  }
}
