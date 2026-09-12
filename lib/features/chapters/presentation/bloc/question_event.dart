import 'package:flutter/foundation.dart';

/// Events for [QuestionBloc].
@immutable
sealed class QuestionEvent {
  const QuestionEvent();
}

/// Load questions for the selected unit.
final class LoadQuestionsEvent extends QuestionEvent {
  final int unitId;
  final int initialIndex;

  const LoadQuestionsEvent({
    this.unitId = 2,
    this.initialIndex = 0,
  });
}

/// User selected an option ID.
final class SelectOptionEvent extends QuestionEvent {
  final String optionId;

  const SelectOptionEvent({required this.optionId});
}

/// Submit selected answer for evaluation.
final class SubmitAnswerEvent extends QuestionEvent {
  const SubmitAnswerEvent();
}

/// Move to the next question / slide.
final class NextQuestionEvent extends QuestionEvent {
  const NextQuestionEvent();
}

/// Trigger 50:50 lifeline to eliminate 2 incorrect choices.
final class TriggerFiftyFiftyEvent extends QuestionEvent {
  const TriggerFiftyFiftyEvent();
}
