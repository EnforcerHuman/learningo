import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_bloc.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_event.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_state.dart';
import 'package:learningo/features/chapters/presentation/widgets/learn_content_widget.dart';
import 'package:learningo/features/chapters/presentation/widgets/match_pairs_question_widget.dart';
import 'package:learningo/features/chapters/presentation/widgets/multiple_choice_question_widget.dart';
import 'package:learningo/features/chapters/presentation/widgets/true_false_question_widget.dart';

/// Routes and renders specific question type widgets based on [QuestionType].
class QuestionContentDispatcher extends StatelessWidget {
  final QuestionActiveState state;
  final QuestionEntity question;

  const QuestionContentDispatcher({
    super.key,
    required this.state,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    switch (question.type) {
      case QuestionType.learn:
        return LearnContentWidget(question: question);

      case QuestionType.mcq:
        return MultipleChoiceQuestionWidget(
          question: question,
          selectedOptionId: state.selectedOptionId,
          isEvaluated: state.isEvaluated,
          disabledOptionIds: state.disabledOptionIds,
          onSelectOption: (optId) {
            context
                .read<QuestionBloc>()
                .add(SelectOptionEvent(optionId: optId));
          },
          onFiftyFiftyTap: () {
            context
                .read<QuestionBloc>()
                .add(const TriggerFiftyFiftyEvent());
          },
        );

      case QuestionType.trueFalse:
        return TrueFalseQuestionWidget(
          question: question,
          selectedOptionId: state.selectedOptionId,
          isEvaluated: state.isEvaluated,
          onSelectOption: (optId) {
            context
                .read<QuestionBloc>()
                .add(SelectOptionEvent(optionId: optId));
          },
          onFiftyFiftyTap: () {
            context
                .read<QuestionBloc>()
                .add(const TriggerFiftyFiftyEvent());
          },
        );

      case QuestionType.matchPairs:
        return MatchPairsQuestionWidget(
          question: question,
          onPairsCompleted: (pairs) {
            // When all pairs matched
            context
                .read<QuestionBloc>()
                .add(const SelectOptionEvent(optionId: 'paired_all'));
          },
        );
    }
  }
}
