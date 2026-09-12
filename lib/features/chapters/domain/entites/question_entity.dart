/// Supported interactive question and slide types.
enum QuestionType {
  learn,
  mcq,
  trueFalse,
  matchPairs,
}

/// Domain entity representing a bullet point in learn slides.
class BulletPointEntity {
  final String text;
  final String? highlightTag;
  final bool isGreen;

  const BulletPointEntity({
    required this.text,
    this.highlightTag,
    this.isGreen = false,
  });
}

/// Domain entity representing an answer option in MCQs or True/False.
class QuestionOptionEntity {
  final String id;
  final String code;
  final String text;
  final bool isCorrect;

  const QuestionOptionEntity({
    required this.id,
    required this.code,
    required this.text,
    required this.isCorrect,
  });
}

/// Domain entity representing an item to be matched in Match Pairs questions.
class PairItemEntity {
  final String id;
  final String text;
  final String matchId;

  const PairItemEntity({
    required this.id,
    required this.text,
    required this.matchId,
  });
}

/// Domain entity representing an interactive question or learning slide.
class QuestionEntity {
  final int id;
  final QuestionType type;
  final String title;
  final String tagText;
  final String? conceptStepBadge;
  final String? imageUrl;
  final List<BulletPointEntity>? bullets;
  final String? memoryText;
  final List<QuestionOptionEntity>? options;
  final String? correctOptionId;
  final String? correctOptionLabel;
  final String? explanation;
  final List<PairItemEntity>? leftPairs;
  final List<PairItemEntity>? rightPairs;

  const QuestionEntity({
    required this.id,
    required this.type,
    required this.title,
    required this.tagText,
    this.conceptStepBadge,
    this.imageUrl,
    this.bullets,
    this.memoryText,
    this.options,
    this.correctOptionId,
    this.correctOptionLabel,
    this.explanation,
    this.leftPairs,
    this.rightPairs,
  });
}
