import 'package:learningo/core/usecases/usecase.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';
import 'package:learningo/features/chapters/domain/repositories/chapters_repository.dart';

/// Use case to fetch interactive questions and learning slides for a unit.
class GetQuestionsUseCase implements UseCase<List<QuestionEntity>, int> {
  final ChaptersRepository repository;

  const GetQuestionsUseCase(this.repository);

  @override
  Future<List<QuestionEntity>> call(int params) async {
    return await repository.getQuestions(params);
  }
}
