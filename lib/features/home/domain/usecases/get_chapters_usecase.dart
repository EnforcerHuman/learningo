import 'package:learningo/core/usecases/usecase.dart';
import 'package:learningo/features/home/domain/entites/chapter_entity.dart';
import 'package:learningo/features/home/domain/repositories/home_repository.dart';

/// Use case to retrieve chapters for the home screen.
class GetChaptersUseCase implements UseCase<List<ChapterEntity>, NoParams> {
  final HomeRepository repository;

  const GetChaptersUseCase(this.repository);

  @override
  Future<List<ChapterEntity>> call([NoParams params = const NoParams()]) async {
    return await repository.getChapters();
  }
}
