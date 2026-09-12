import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';
import 'package:learningo/features/chapters/domain/usecases/get_questions_usecase.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_event.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_state.dart';

/// Business logic component managing interactive question flows.
class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final GetQuestionsUseCase getQuestionsUseCase;

  QuestionBloc({required this.getQuestionsUseCase})
      : super(const QuestionInitialState()) {
    on<LoadQuestionsEvent>(_onLoadQuestions);
    on<SelectOptionEvent>(_onSelectOption);
    on<SubmitAnswerEvent>(_onSubmitAnswer);
    on<NextQuestionEvent>(_onNextQuestion);
    on<TriggerFiftyFiftyEvent>(_onTriggerFiftyFifty);
  }

  Future<void> _onLoadQuestions(
    LoadQuestionsEvent event,
    Emitter<QuestionState> emit,
  ) async {
    emit(const QuestionLoadingState());
    final questions = await getQuestionsUseCase(event.unitId);
    final startIndex = questions.isEmpty
        ? 0
        : event.initialIndex.clamp(0, questions.length - 1);
    emit(QuestionActiveState(
      questions: questions,
      currentIndex: startIndex,
    ));
  }

  void _onSelectOption(
    SelectOptionEvent event,
    Emitter<QuestionState> emit,
  ) {
    if (state is QuestionActiveState) {
      final s = state as QuestionActiveState;
      if (s.isEvaluated) return; // Prevent changing after evaluation

      // If already selected, evaluate or toggle
      emit(s.copyWith(selectedOptionId: event.optionId));
      add(const SubmitAnswerEvent());
    }
  }

  void _onSubmitAnswer(
    SubmitAnswerEvent event,
    Emitter<QuestionState> emit,
  ) {
    if (state is QuestionActiveState) {
      final s = state as QuestionActiveState;
      if (s.selectedOptionId == null) return;

      final current = s.currentQuestion;
      final isCorrect = s.selectedOptionId == current.correctOptionId;

      emit(s.copyWith(
        isEvaluated: true,
        isCorrect: isCorrect,
      ));
    }
  }

  void _onNextQuestion(
    NextQuestionEvent event,
    Emitter<QuestionState> emit,
  ) {
    if (state is QuestionActiveState) {
      final s = state as QuestionActiveState;
      if (s.currentIndex < s.questions.length - 1) {
        emit(s.copyWith(
          currentIndex: s.currentIndex + 1,
          selectedOptionId: null,
          isEvaluated: false,
          isCorrect: null,
          disabledOptionIds: {},
        ));
      }
    }
  }

  void _onTriggerFiftyFifty(
    TriggerFiftyFiftyEvent event,
    Emitter<QuestionState> emit,
  ) {
    if (state is QuestionActiveState) {
      final s = state as QuestionActiveState;
      if (s.isEvaluated) return;

      final current = s.currentQuestion;
      if (current.options == null || current.type != QuestionType.mcq) return;

      final incorrectOptions = current.options!
          .where((opt) => opt.id != current.correctOptionId)
          .map((opt) => opt.id)
          .take(2)
          .toSet();

      emit(s.copyWith(disabledOptionIds: incorrectOptions));
    }
  }
}
