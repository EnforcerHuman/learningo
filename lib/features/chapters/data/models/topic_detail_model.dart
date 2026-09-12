import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_detail_model.freezed.dart';
part 'topic_detail_model.g.dart';

@freezed
abstract class LocalizedTextModel with _$LocalizedTextModel {
  const factory LocalizedTextModel({
    String? hi,
    String? en,
  }) = _LocalizedTextModel;

  factory LocalizedTextModel.fromJson(Map<String, dynamic> json) =>
      _$LocalizedTextModelFromJson(json);
}

@freezed
abstract class SubjectModel with _$SubjectModel {
  const factory SubjectModel({
    String? id,
    @JsonKey(name: 'name_en') String? nameEn,
    @JsonKey(name: 'name_hi') String? nameHi,
    @JsonKey(name: 'hue_key') String? hueKey,
  }) = _SubjectModel;

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);
}

@freezed
abstract class TopicTotalsModel with _$TopicTotalsModel {
  const factory TopicTotalsModel({
    int? concepts,
    @JsonKey(name: 'questions_in_run') int? questionsInRun,
    @JsonKey(name: 'match_round') int? matchRound,
    @JsonKey(name: 'question_batches') List<int>? questionBatches,
    @JsonKey(name: 'cards_with_image') int? cardsWithImage,
    @JsonKey(name: 'cards_with_audio') int? cardsWithAudio,
  }) = _TopicTotalsModel;

  factory TopicTotalsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicTotalsModelFromJson(json);
}

@freezed
abstract class TopicInfoModel with _$TopicInfoModel {
  const factory TopicInfoModel({
    @JsonKey(name: 'unit_index') int? unitIndex,
    String? id,
    @JsonKey(name: 'name_en') String? nameEn,
    @JsonKey(name: 'name_hi') String? nameHi,
    String? icon,
    String? subtitle,
    TopicTotalsModel? totals,
  }) = _TopicInfoModel;

  factory TopicInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TopicInfoModelFromJson(json);
}

@freezed
abstract class ConceptQuestionModel with _$ConceptQuestionModel {
  const factory ConceptQuestionModel({
    String? type,
    LocalizedTextModel? prompt,
    dynamic answer,
    Map<String, List<String>?>? options,
  }) = _ConceptQuestionModel;

  factory ConceptQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$ConceptQuestionModelFromJson(json);
}

@freezed
abstract class ConceptItemModel with _$ConceptItemModel {
  const factory ConceptItemModel({
    int? no,
    String? id,
    LocalizedTextModel? title,
    LocalizedTextModel? fact,
    ConceptQuestionModel? question,
    LocalizedTextModel? image,
    LocalizedTextModel? audio,
  }) = _ConceptItemModel;

  factory ConceptItemModel.fromJson(Map<String, dynamic> json) =>
      _$ConceptItemModelFromJson(json);
}

@freezed
abstract class TopicDetailResponseModel with _$TopicDetailResponseModel {
  const factory TopicDetailResponseModel({
    String? schema,
    SubjectModel? subject,
    TopicInfoModel? topic,
    List<ConceptItemModel>? concepts,
  }) = _TopicDetailResponseModel;

  factory TopicDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TopicDetailResponseModelFromJson(json);
}
