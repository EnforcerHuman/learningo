import 'package:flutter_test/flutter_test.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';
import 'package:learningo/features/chapters/domain/entites/unit_detail_entity.dart';
import 'package:learningo/features/chapters/domain/repositories/chapters_repository.dart';
import 'package:learningo/features/chapters/domain/usecases/get_questions_usecase.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_bloc.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_event.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_state.dart';

class MockChaptersRepository implements ChaptersRepository {
  final List<QuestionEntity> mockQuestions;
  MockChaptersRepository(this.mockQuestions);

  @override
  Future<List<QuestionEntity>> getQuestions(int unitId) async => mockQuestions;

  @override
  Future<UnitDetailEntity> getUnitDetail(int unitId) {
    throw UnimplementedError();
  }
}

void main() {
  group('QuestionBloc Progress Bar Tests', () {
    late List<QuestionEntity> testQuestions;
    late MockChaptersRepository mockRepository;
    late GetQuestionsUseCase getQuestionsUseCase;

    setUp(() {
      testQuestions = [
        const QuestionEntity(
          id: 1,
          type: QuestionType.learn,
          title: 'Learn 1',
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
            QuestionOptionEntity(
              id: 'opt2',
              code: 'B',
              text: 'Ans B',
              isCorrect: false,
            ),
          ],
          correctOptionId: 'opt1',
          correctOptionLabel: 'Ans A',
          explanation: 'Explanation 1',
        ),
        const QuestionEntity(
          id: 3,
          type: QuestionType.trueFalse,
          title: 'Question 2',
          tagText: 'TRUE OR FALSE',
          options: [
            QuestionOptionEntity(
              id: 'tf_true',
              code: 'TRUE',
              text: 'TRUE',
              isCorrect: true,
            ),
            QuestionOptionEntity(
              id: 'tf_false',
              code: 'FALSE',
              text: 'FALSE',
              isCorrect: false,
            ),
          ],
          correctOptionId: 'tf_true',
          correctOptionLabel: '✓ TRUE',
          explanation: 'Explanation 2',
        ),
      ];

      mockRepository = MockChaptersRepository(testQuestions);
      getQuestionsUseCase = GetQuestionsUseCase(mockRepository);
    });

    test('progressFraction and stepDisplay update sequentially across question steps', () async {
      final bloc = QuestionBloc(getQuestionsUseCase: getQuestionsUseCase);

      // 1. Initial State
      expect(bloc.state, isA<QuestionInitialState>());

      // 2. Load questions (3 total questions)
      bloc.add(const LoadQuestionsEvent(unitId: 1));
      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<QuestionLoadingState>(),
          predicate<QuestionActiveState>((state) {
            return state.currentIndex == 0 &&
                state.stepDisplay == '1/3' &&
                (state.progressFraction - (1 / 3)).abs() < 0.001;
          }),
        ]),
      );

      // 3. Move from Learn (Q1) to Q2
      bloc.add(const NextQuestionEvent());
      await expectLater(
        bloc.stream,
        emits(predicate<QuestionActiveState>((state) {
          return state.currentIndex == 1 &&
              state.stepDisplay == '2/3' &&
              (state.progressFraction - (2 / 3)).abs() < 0.001 &&
              !state.isEvaluated;
        })),
      );

      // 4. Select option and submit on Q2
      bloc.add(const SelectOptionEvent(optionId: 'opt1'));
      await expectLater(
        bloc.stream,
        emits(predicate<QuestionActiveState>((state) => state.selectedOptionId == 'opt1')),
      );

      bloc.add(const SubmitAnswerEvent());
      await expectLater(
        bloc.stream,
        emits(predicate<QuestionActiveState>((state) => state.isEvaluated && state.isCorrect == true)),
      );

      // 5. Move to Q3
      bloc.add(const NextQuestionEvent());
      await expectLater(
        bloc.stream,
        emits(predicate<QuestionActiveState>((state) {
          return state.currentIndex == 2 &&
              state.stepDisplay == '3/3' &&
              (state.progressFraction - 1.0).abs() < 0.001 &&
              state.isLastQuestion;
        })),
      );

      await bloc.close();
    });
  });
}
