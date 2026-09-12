import 'package:learningo/features/home/domain/entites/chapter_entity.dart';

/// Data model representing a chapter with JSON serialization support.
class ChapterModel extends ChapterEntity {
  const ChapterModel({
    required super.id,
    required super.index,
    required super.nameEn,
    required super.nameHi,
    required super.units,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'] as int? ?? 0,
      index: json['index'] as int? ?? 0,
      nameEn: json['name_en'] as String? ?? '',
      nameHi: json['name_hi'] as String? ?? '',
      units: (json['units'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'index': index,
      'name_en': nameEn,
      'name_hi': nameHi,
      'units': units,
    };
  }
}
