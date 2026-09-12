import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:learningo/features/chapters/data/models/topic_detail_model.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';
import 'package:learningo/features/chapters/domain/entites/topic_detail_entity.dart';
import 'package:learningo/features/chapters/domain/entites/unit_detail_entity.dart';

/// Local data source interface for the Chapters feature.
abstract class ChaptersLocalDataSource {
  Future<UnitDetailEntity> getUnitDetail(int unitId);
  Future<List<QuestionEntity>> getQuestions(int unitId);
  Future<TopicDetailEntity> getTopicDetail();
}

/// Implementation of [ChaptersLocalDataSource] reading from mock JSON assets.
class ChaptersLocalDataSourceImpl implements ChaptersLocalDataSource {
  static const String _mockTopicAssetPath =
      'assets/mock/topic_detail_response.json';

  @override
  Future<TopicDetailEntity> getTopicDetail() async {
    final jsonString = await rootBundle.loadString(_mockTopicAssetPath);
    final decoded = json.decode(jsonString) as Map<String, dynamic>;
    final model = TopicDetailResponseModel.fromJson(decoded);

    return TopicDetailEntity(
      schema: model.schema ?? '',
      subjectNameEn: model.subject?.nameEn ?? '',
      topicNameEn: model.topic?.nameEn ?? '',
      totalConcepts: model.topic?.totals?.concepts ?? 0,
      totalQuestions: model.topic?.totals?.questionsInRun ?? 0,
      concepts: model.concepts?.map((c) {
            return ConceptItemEntity(
              no: c.no ?? 0,
              id: c.id ?? '',
              title: LocalizedTextEntity(
                hi: c.title?.hi,
                en: c.title?.en,
              ),
              fact: LocalizedTextEntity(
                hi: c.fact?.hi,
                en: c.fact?.en,
              ),
              question: ConceptQuestionEntity(
                type: c.question?.type ?? 'mcq',
                prompt: LocalizedTextEntity(
                  hi: c.question?.prompt?.hi,
                  en: c.question?.prompt?.en,
                ),
                answer: c.question?.answer,
                options: c.question?.options,
              ),
              image: LocalizedTextEntity(
                hi: c.image?.hi,
                en: c.image?.en,
              ),
              audio: LocalizedTextEntity(
                hi: c.audio?.hi,
                en: c.audio?.en,
              ),
            );
          }).toList() ??
          const [],
    );
  }

  @override
  Future<UnitDetailEntity> getUnitDetail(int unitId) async {
    final topicDetail = await getTopicDetail();

    final topics = topicDetail.concepts.map((c) {
      return TopicItemEntity(
        code: '1.${c.no}',
        title: c.title.getLocalized('en'),
      );
    }).toList();

    return UnitDetailEntity(
      unitNumber: unitId,
      chapterTitle: topicDetail.subjectNameEn,
      unitTitle: topicDetail.topicNameEn,
      conceptsCount: topicDetail.totalConcepts,
      questionsCount: topicDetail.totalQuestions,
      completionText: '2.7k completed this unit · only 69% scored 100%',
      topics: topics,
    );
  }

  @override
  Future<List<QuestionEntity>> getQuestions(int unitId) async {
    final topicDetail = await getTopicDetail();
    final questions = <QuestionEntity>[];

    for (int i = 0; i < topicDetail.concepts.length; i++) {
      final concept = topicDetail.concepts[i];

      // 1. Learn Slide for the concept
      questions.add(
        QuestionEntity(
          id: (concept.no * 10) + 1,
          type: QuestionType.learn,
          title: concept.title.getLocalized('en'),
          tagText: 'LEARN',
          conceptStepBadge: '${concept.no} / ${topicDetail.concepts.length}',
          imageUrl: concept.image?.en,
          bullets: [
            BulletPointEntity(
              text: concept.fact.getLocalized('en'),
              isGreen: false,
            ),
          ],
          memoryText: '84% of 3.1k people remember this',
        ),
      );

      // 2. Question Slide (MCQ or True/False)
      final q = concept.question;
      if (q.type == 'true_false') {
        final isAnswerTrue = q.answer == true;
        questions.add(
          QuestionEntity(
            id: (concept.no * 10) + 2,
            type: QuestionType.trueFalse,
            title: q.prompt.getLocalized('en'),
            tagText: 'TRUE OR FALSE',
            options: [
              const QuestionOptionEntity(
                id: 'tf_true',
                code: 'TRUE',
                text: 'TRUE',
                isCorrect: true,
              ),
              const QuestionOptionEntity(
                id: 'tf_false',
                code: 'FALSE',
                text: 'FALSE',
                isCorrect: false,
              ),
            ],
            correctOptionId: isAnswerTrue ? 'tf_true' : 'tf_false',
            correctOptionLabel: isAnswerTrue ? '✓ TRUE' : '✕ FALSE',
            explanation: concept.fact.getLocalized('en'),
          ),
        );
      } else {
        // MCQ
        final enOptions = q.options?['en'] ?? [];
        final answerEn = q.answer?.toString() ?? '';
        final options = <QuestionOptionEntity>[];

        for (int optIdx = 0; optIdx < enOptions.length; optIdx++) {
          final optText = enOptions[optIdx];
          final letterCode = String.fromCharCode(65 + optIdx); // A, B, C, D
          options.add(
            QuestionOptionEntity(
              id: 'opt_${concept.no}_$optIdx',
              code: letterCode,
              text: optText,
              isCorrect: optText.trim().toLowerCase() ==
                  answerEn.trim().toLowerCase(),
            ),
          );
        }

        final correctOpt = options.firstWhere(
          (o) => o.isCorrect,
          orElse: () => options.isNotEmpty ? options.first : const QuestionOptionEntity(
            id: 'opt_default',
            code: 'A',
            text: '',
            isCorrect: true,
          ),
        );

        questions.add(
          QuestionEntity(
            id: (concept.no * 10) + 2,
            type: QuestionType.mcq,
            title: q.prompt.getLocalized('en'),
            tagText: 'PICK THE RIGHT OPTION',
            options: options,
            correctOptionId: correctOpt.id,
            correctOptionLabel: correctOpt.text,
            explanation: concept.fact.getLocalized('en'),
          ),
        );
      }
    }

    return questions;
  }
}
