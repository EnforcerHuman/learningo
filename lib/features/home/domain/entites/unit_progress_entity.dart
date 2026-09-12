/// Domain entity representing the progress and mastery state of a single unit / month.
class UnitProgressEntity {
  final String unitName;
  final int unitIndex;
  final double progress;
  final int? conceptsCount;
  final int completedConcepts;
  final int lastQuestionIndex;
  final bool isCompleted;
  final bool isActive;

  const UnitProgressEntity({
    required this.unitName,
    required this.unitIndex,
    this.progress = 0.0,
    this.conceptsCount,
    this.completedConcepts = 0,
    this.lastQuestionIndex = 0,
    this.isCompleted = false,
    this.isActive = false,
  });

  /// Returns formatted percentage string (e.g. "23% mastered")
  String get masteryStatusText {
    if (isCompleted || progress >= 1.0) {
      final pct = (progress * 100).round();
      return '$pct% mastered';
    } else if (isActive) {
      if (progress > 0) {
        final pct = (progress * 100).round();
        return '$pct% mastered';
      }
      return '${conceptsCount ?? 10} Concepts';
    } else {
      return '${conceptsCount ?? 10} Concepts';
    }
  }

  UnitProgressEntity copyWith({
    String? unitName,
    int? unitIndex,
    double? progress,
    int? conceptsCount,
    int? completedConcepts,
    int? lastQuestionIndex,
    bool? isCompleted,
    bool? isActive,
  }) {
    return UnitProgressEntity(
      unitName: unitName ?? this.unitName,
      unitIndex: unitIndex ?? this.unitIndex,
      progress: progress ?? this.progress,
      conceptsCount: conceptsCount ?? this.conceptsCount,
      completedConcepts: completedConcepts ?? this.completedConcepts,
      lastQuestionIndex: lastQuestionIndex ?? this.lastQuestionIndex,
      isCompleted: isCompleted ?? this.isCompleted,
      isActive: isActive ?? this.isActive,
    );
  }
}
