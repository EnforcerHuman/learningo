import 'package:learningo/features/chapters/data/datasource/chapters_local_datasource.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';
import 'package:learningo/features/chapters/domain/entites/unit_detail_entity.dart';
import 'package:learningo/features/chapters/domain/repositories/chapters_repository.dart';

/// Concrete repository implementation for the Chapters feature.
class ChaptersRepositoryImpl implements ChaptersRepository {
  final ChaptersLocalDataSource localDataSource;

  const ChaptersRepositoryImpl({required this.localDataSource});

  @override
  Future<UnitDetailEntity> getUnitDetail(int unitId) async {
    return await localDataSource.getUnitDetail(unitId);
  }

  @override
  Future<List<QuestionEntity>> getQuestions(int unitId) async {
    return await localDataSource.getQuestions(unitId);
  }
}
