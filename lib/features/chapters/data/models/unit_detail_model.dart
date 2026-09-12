import 'package:learningo/features/chapters/domain/entites/unit_detail_entity.dart';

/// Topic item data model.
class TopicItemModel extends TopicItemEntity {
  const TopicItemModel({
    required super.code,
    required super.title,
  });

  factory TopicItemModel.fromJson(Map<String, dynamic> json) {
    return TopicItemModel(
      code: json['code'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'title': title,
    };
  }
}

/// Unit detail data model with serialization.
class UnitDetailModel extends UnitDetailEntity {
  const UnitDetailModel({
    required super.unitNumber,
    required super.chapterTitle,
    required super.unitTitle,
    required super.conceptsCount,
    required super.questionsCount,
    required super.completionText,
    required super.topics,
  });

  factory UnitDetailModel.fromJson(Map<String, dynamic> json) {
    final topicsList = (json['topics'] as List<dynamic>?)
            ?.map((e) => TopicItemModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [];

    return UnitDetailModel(
      unitNumber: json['unit_number'] as int? ?? 2,
      chapterTitle: json['chapter_title'] as String? ??
          'Important National and International Days',
      unitTitle: json['unit_title'] as String? ?? 'February',
      conceptsCount: json['concepts_count'] as int? ?? 8,
      questionsCount: json['questions_count'] as int? ?? 9,
      completionText: json['completion_text'] as String? ??
          '2.7k completed this unit · only 69% scored 100%',
      topics: topicsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unit_number': unitNumber,
      'chapter_title': chapterTitle,
      'unit_title': unitTitle,
      'concepts_count': conceptsCount,
      'questions_count': questionsCount,
      'completion_text': completionText,
      'topics': topics
          .map((e) => (e is TopicItemModel)
              ? e.toJson()
              : {'code': e.code, 'title': e.title})
          .toList(),
    };
  }
}
