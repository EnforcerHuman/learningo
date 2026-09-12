import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';
import 'package:learningo/features/chapters/presentation/widgets/match_pairs_question_widget.dart';

void main() {
  group('MatchPairsQuestionWidget Tests', () {
    const testQuestion = QuestionEntity(
      id: 99,
      type: QuestionType.matchPairs,
      title: 'Pick the right partner for each item on the left',
      tagText: 'MATCH THE PAIRS',
      leftPairs: [
        PairItemEntity(id: 'l1', text: 'Republic Day', matchId: 'r1'),
        PairItemEntity(id: 'l2', text: 'Army Day', matchId: 'r2'),
      ],
      rightPairs: [
        PairItemEntity(id: 'r1', text: '26 January', matchId: 'l1'),
        PairItemEntity(id: 'r2', text: '15 January', matchId: 'l2'),
      ],
    );

    testWidgets('renders prompt, items on left and right, and handles matching', (tester) async {
      Map<String, String>? completedPairs;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MatchPairsQuestionWidget(
              question: testQuestion,
              onPairsCompleted: (pairs) {
                completedPairs = pairs;
              },
            ),
          ),
        ),
      );

      // Verify texts
      expect(find.text('MATCH THE PAIRS'), findsOneWidget);
      expect(find.text('Pick the right partner for each item on the left'), findsOneWidget);
      expect(find.text('Republic Day'), findsOneWidget);
      expect(find.text('26 January'), findsOneWidget);

      // Tap 'Republic Day' then '26 January'
      await tester.tap(find.text('Republic Day'));
      await tester.pump();
      await tester.tap(find.text('26 January'));
      await tester.pump();

      expect(completedPairs, isNotNull);
      expect(completedPairs!['l1'], 'r1');
    });
  });
}
