import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:learningo/features/home/data/models/chapter_model.dart';

/// Data source interface for fetching local home data.
abstract class HomeLocalDataSource {
  Future<List<ChapterModel>> getChapters();
}

/// Implementation of [HomeLocalDataSource] that reads mock JSON from assets.
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  static const String _mockAssetPath = 'assets/mock/chapters_response.json';

  @override
  Future<List<ChapterModel>> getChapters() async {
    final jsonString = await rootBundle.loadString(_mockAssetPath);
    final decoded = json.decode(jsonString) as Map<String, dynamic>;
    final dataList = decoded['data'] as List<dynamic>? ?? [];

    return dataList
        .map((item) => ChapterModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
