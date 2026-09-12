import 'package:learningo/features/chapters/domain/entites/question_entity.dart';

/// Question data model with serialization.
class QuestionModel extends QuestionEntity {
  const QuestionModel({
    required super.id,
    required super.type,
    required super.title,
    required super.tagText,
    super.conceptStepBadge,
    super.imageUrl,
    super.bullets,
    super.memoryText,
    super.options,
    super.correctOptionId,
    super.correctOptionLabel,
    super.explanation,
  });
}
