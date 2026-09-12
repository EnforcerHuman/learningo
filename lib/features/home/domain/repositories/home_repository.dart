import 'package:learningo/features/home/domain/entites/chapter_entity.dart';

/// Contract defining home domain data operations.
abstract class HomeRepository {
  /// Fetches the list of chapters and units for the home learning roadmap.
  Future<List<ChapterEntity>> getChapters();
}
