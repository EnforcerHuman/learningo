// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalizedTextModel _$LocalizedTextModelFromJson(Map<String, dynamic> json) =>
    _LocalizedTextModel(hi: json['hi'] as String?, en: json['en'] as String?);

Map<String, dynamic> _$LocalizedTextModelToJson(_LocalizedTextModel instance) =>
    <String, dynamic>{'hi': instance.hi, 'en': instance.en};

_SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) =>
    _SubjectModel(
      id: json['id'] as String?,
      nameEn: json['name_en'] as String?,
      nameHi: json['name_hi'] as String?,
      hueKey: json['hue_key'] as String?,
    );

Map<String, dynamic> _$SubjectModelToJson(_SubjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_hi': instance.nameHi,
      'hue_key': instance.hueKey,
    };

_TopicTotalsModel _$TopicTotalsModelFromJson(Map<String, dynamic> json) =>
    _TopicTotalsModel(
      concepts: (json['concepts'] as num?)?.toInt(),
      questionsInRun: (json['questions_in_run'] as num?)?.toInt(),
      matchRound: (json['match_round'] as num?)?.toInt(),
      questionBatches: (json['question_batches'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      cardsWithImage: (json['cards_with_image'] as num?)?.toInt(),
      cardsWithAudio: (json['cards_with_audio'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TopicTotalsModelToJson(_TopicTotalsModel instance) =>
    <String, dynamic>{
      'concepts': instance.concepts,
      'questions_in_run': instance.questionsInRun,
      'match_round': instance.matchRound,
      'question_batches': instance.questionBatches,
      'cards_with_image': instance.cardsWithImage,
      'cards_with_audio': instance.cardsWithAudio,
    };

_TopicInfoModel _$TopicInfoModelFromJson(Map<String, dynamic> json) =>
    _TopicInfoModel(
      unitIndex: (json['unit_index'] as num?)?.toInt(),
      id: json['id'] as String?,
      nameEn: json['name_en'] as String?,
      nameHi: json['name_hi'] as String?,
      icon: json['icon'] as String?,
      subtitle: json['subtitle'] as String?,
      totals: json['totals'] == null
          ? null
          : TopicTotalsModel.fromJson(json['totals'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopicInfoModelToJson(_TopicInfoModel instance) =>
    <String, dynamic>{
      'unit_index': instance.unitIndex,
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_hi': instance.nameHi,
      'icon': instance.icon,
      'subtitle': instance.subtitle,
      'totals': instance.totals,
    };

_ConceptQuestionModel _$ConceptQuestionModelFromJson(
  Map<String, dynamic> json,
) => _ConceptQuestionModel(
  type: json['type'] as String?,
  prompt: json['prompt'] == null
      ? null
      : LocalizedTextModel.fromJson(json['prompt'] as Map<String, dynamic>),
  answer: json['answer'],
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) =>
        MapEntry(k, (e as List<dynamic>?)?.map((e) => e as String).toList()),
  ),
);

Map<String, dynamic> _$ConceptQuestionModelToJson(
  _ConceptQuestionModel instance,
) => <String, dynamic>{
  'type': instance.type,
  'prompt': instance.prompt,
  'answer': instance.answer,
  'options': instance.options,
};

_ConceptItemModel _$ConceptItemModelFromJson(Map<String, dynamic> json) =>
    _ConceptItemModel(
      no: (json['no'] as num?)?.toInt(),
      id: json['id'] as String?,
      title: json['title'] == null
          ? null
          : LocalizedTextModel.fromJson(json['title'] as Map<String, dynamic>),
      fact: json['fact'] == null
          ? null
          : LocalizedTextModel.fromJson(json['fact'] as Map<String, dynamic>),
      question: json['question'] == null
          ? null
          : ConceptQuestionModel.fromJson(
              json['question'] as Map<String, dynamic>,
            ),
      image: json['image'] == null
          ? null
          : LocalizedTextModel.fromJson(json['image'] as Map<String, dynamic>),
      audio: json['audio'] == null
          ? null
          : LocalizedTextModel.fromJson(json['audio'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConceptItemModelToJson(_ConceptItemModel instance) =>
    <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'title': instance.title,
      'fact': instance.fact,
      'question': instance.question,
      'image': instance.image,
      'audio': instance.audio,
    };

_TopicDetailResponseModel _$TopicDetailResponseModelFromJson(
  Map<String, dynamic> json,
) => _TopicDetailResponseModel(
  schema: json['schema'] as String?,
  subject: json['subject'] == null
      ? null
      : SubjectModel.fromJson(json['subject'] as Map<String, dynamic>),
  topic: json['topic'] == null
      ? null
      : TopicInfoModel.fromJson(json['topic'] as Map<String, dynamic>),
  concepts: (json['concepts'] as List<dynamic>?)
      ?.map((e) => ConceptItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TopicDetailResponseModelToJson(
  _TopicDetailResponseModel instance,
) => <String, dynamic>{
  'schema': instance.schema,
  'subject': instance.subject,
  'topic': instance.topic,
  'concepts': instance.concepts,
};
