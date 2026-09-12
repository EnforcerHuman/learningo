import 'package:learningo/features/chapters/domain/entites/question_entity.dart';
import 'package:learningo/features/chapters/domain/entites/unit_detail_entity.dart';

/// Repository contract for fetching unit details and interactive questions in the Chapters feature.
abstract class ChaptersRepository {
  /// Fetches details for a specific unit by its index or ID.
  Future<UnitDetailEntity> getUnitDetail(int unitId);

  /// Fetches the interactive questions and learning slides for a unit.
  Future<List<QuestionEntity>> getQuestions(int unitId);
}
