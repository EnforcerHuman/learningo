import 'package:learningo/features/home/data/datasource/home_local_datasource.dart';
import 'package:learningo/features/home/domain/entites/chapter_entity.dart';
import 'package:learningo/features/home/domain/repositories/home_repository.dart';

/// Concrete implementation of [HomeRepository] following the Repository pattern.
class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  const HomeRepositoryImpl({required this.localDataSource});

  @override
  Future<List<ChapterEntity>> getChapters() async {
    return await localDataSource.getChapters();
  }
}
