/// Domain entity representing a topic within a unit.
class TopicItemEntity {
  final String code;
  final String title;

  const TopicItemEntity({
    required this.code,
    required this.title,
  });
}

/// Domain entity representing complete unit details including metadata,
/// concept metrics, topics, and community completion stats.
class UnitDetailEntity {
  final int unitNumber;
  final String chapterTitle;
  final String unitTitle;
  final int conceptsCount;
  final int questionsCount;
  final String completionText;
  final List<TopicItemEntity> topics;

  const UnitDetailEntity({
    required this.unitNumber,
    required this.chapterTitle,
    required this.unitTitle,
    required this.conceptsCount,
    required this.questionsCount,
    required this.completionText,
    required this.topics,
  });
}
