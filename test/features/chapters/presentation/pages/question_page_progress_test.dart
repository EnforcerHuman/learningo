import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';
import 'package:learningo/features/chapters/domain/entites/unit_detail_entity.dart';
import 'package:learningo/features/chapters/domain/repositories/chapters_repository.dart';
import 'package:learningo/features/chapters/domain/usecases/get_questions_usecase.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_bloc.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_event.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_state.dart';
import 'package:learningo/features/chapters/presentation/pages/question_page.dart';
import 'package:learningo/features/home/domain/entites/chapter_entity.dart';
import 'package:learningo/features/home/domain/repositories/home_repository.dart';
import 'package:learningo/features/home/domain/usecases/get_chapters_usecase.dart';
import 'package:learningo/features/home/presentation/bloc/home_bloc.dart';
import 'package:learningo/features/home/presentation/bloc/home_event.dart';
import 'package:learningo/features/home/presentation/bloc/home_state.dart';

class MockChaptersRepository implements ChaptersRepository {
  final List<QuestionEntity> questions;
  MockChaptersRepository(this.questions);

  @override
  Future<List<QuestionEntity>> getQuestions(int unitId) async => questions;

  @override
  Future<UnitDetailEntity> getUnitDetail(int unitId) {
    throw UnimplementedError();
  }
}

class MockHomeRepository implements HomeRepository {
  @override
  Future<List<ChapterEntity>> getChapters() async {
    return [
      const ChapterEntity(
        id: 1,
        index: 1,
        nameEn: 'Important Days',
        nameHi: 'दिवस',
        units: ['January', 'February', 'March'],
      ),
    ];
  }
}

void main() {
  group('QuestionPage to HomeBloc Progress Integration', () {
    late HomeBloc homeBloc;
    late QuestionBloc questionBloc;
    late List<QuestionEntity> testQuestions;

    setUp(() {
      testQuestions = [
        const QuestionEntity(
          id: 1,
          type: QuestionType.learn,
          title: 'Learn Slide 1',
          tagText: 'LEARN',
          conceptStepBadge: '1 / 2',
        ),
        const QuestionEntity(
          id: 2,
          type: QuestionType.mcq,
          title: 'Question 1',
          tagText: 'PICK THE RIGHT OPTION',
          options: [
            QuestionOptionEntity(
              id: 'opt1',
              code: 'A',
              text: 'Ans A',
              isCorrect: true,
            ),
          ],
          correctOptionId: 'opt1',
          correctOptionLabel: 'Ans A',
          explanation: 'Explanation',
        ),
      ];

      homeBloc = HomeBloc(
        getChaptersUseCase: GetChaptersUseCase(MockHomeRepository()),
      );

      questionBloc = QuestionBloc(
        getQuestionsUseCase: GetQuestionsUseCase(
          MockChaptersRepository(testQuestions),
        ),
      );
    });

    tearDown(() {
      homeBloc.close();
      questionBloc.close();
    });

    testWidgets('answering questions in QuestionPage dispatches UpdateMonthProgressEvent to HomeBloc', (tester) async {
      // 1. Initialize HomeBloc using runAsync so async repository calls resolve
      await tester.runAsync(() async {
        homeBloc.add(const LoadHomeDataEvent());
        await homeBloc.stream.firstWhere((s) => s is HomeDataLoadedState);
      });

      // 2. Render QuestionPage with monthName, homeBloc, and questionBloc
      await tester.pumpWidget(
        MaterialApp(
          home: QuestionPage(
            unitId: 1,
            monthName: 'March',
            homeBloc: homeBloc,
            questionBloc: questionBloc,
          ),
        ),
      );

      // 3. Trigger LoadQuestionsEvent and advance to completed Concept 1
      await tester.runAsync(() async {
        questionBloc.add(const LoadQuestionsEvent(unitId: 1));
        await questionBloc.stream.firstWhere((s) => s is QuestionActiveState);
        questionBloc.add(const NextQuestionEvent());
        await questionBloc.stream.firstWhere(
          (s) => s is QuestionActiveState && s.currentIndex == 1,
        );
        questionBloc.add(const SelectOptionEvent(optionId: 'opt1'));
        await questionBloc.stream.firstWhere(
          (s) => s is QuestionActiveState && s.isEvaluated,
        );
      });
      await tester.pumpAndSettle();

      // Check that month progress was dispatched to HomeBloc for March
      expect(homeBloc.state, isA<HomeDataLoadedState>());
      final state = homeBloc.state as HomeDataLoadedState;
      final marchProgress = state.unitProgressMap['March'];
      expect(marchProgress, isNotNull);
      expect(marchProgress!.progress, closeTo(1 / 10, 0.001));
      expect(marchProgress.completedConcepts, 1);
      expect(marchProgress.lastQuestionIndex, 1);
      expect(marchProgress.isCompleted, isFalse);
      expect(marchProgress.masteryStatusText, '10% mastered');
      expect(marchProgress.unitName, 'March');
    });
  });
}
