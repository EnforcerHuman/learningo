/// Domain entity for multilingual localized strings.
class LocalizedTextEntity {
  final String? hi;
  final String? en;

  const LocalizedTextEntity({this.hi, this.en});

  String getLocalized([String lang = 'en']) {
    if (lang == 'hi' && hi != null && hi!.isNotEmpty) return hi!;
    return en ?? hi ?? '';
  }
}

/// Domain entity for concept question data.
class ConceptQuestionEntity {
  final String type; // 'mcq' or 'true_false'
  final LocalizedTextEntity prompt;
  final dynamic answer; // String or bool
  final Map<String, List<String>?>? options;

  const ConceptQuestionEntity({
    required this.type,
    required this.prompt,
    required this.answer,
    this.options,
  });
}

/// Domain entity for a single concept item with learning fact and question.
class ConceptItemEntity {
  final int no;
  final String id;
  final LocalizedTextEntity title;
  final LocalizedTextEntity fact;
  final ConceptQuestionEntity question;
  final LocalizedTextEntity? image;
  final LocalizedTextEntity? audio;

  const ConceptItemEntity({
    required this.no,
    required this.id,
    required this.title,
    required this.fact,
    required this.question,
    this.image,
    this.audio,
  });
}

/// Domain entity for topic details payload.
class TopicDetailEntity {
  final String schema;
  final String subjectNameEn;
  final String topicNameEn;
  final int totalConcepts;
  final int totalQuestions;
  final List<ConceptItemEntity> concepts;

  const TopicDetailEntity({
    required this.schema,
    required this.subjectNameEn,
    required this.topicNameEn,
    required this.totalConcepts,
    required this.totalQuestions,
    required this.concepts,
  });
}
