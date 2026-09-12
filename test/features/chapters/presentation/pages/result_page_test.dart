import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learningo/features/chapters/domain/entites/slipped_concept_entity.dart';
import 'package:learningo/features/chapters/presentation/pages/result_page.dart';

void main() {
  group('ResultPage Widget Tests', () {
    testWidgets('renders success checkmark, month title, stat metrics, and continue button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ResultPage(
            monthName: 'January',
            accuracyPercentage: 36,
            yourTime: '15m 45s',
            classAverageTime: '5m 10s',
            slippedConcepts: const [
              SlippedConceptEntity(title: 'World Hindi Day'),
              SlippedConceptEntity(title: 'Army Day'),
              SlippedConceptEntity(title: 'Pravasi Bharatiya Divas'),
            ],
          ),
        ),
      );

      // Verify UI text elements
      expect(find.text('Result'), findsOneWidget);
      expect(find.text('LESSON COMPLETED'), findsOneWidget);
      expect(find.text('January'), findsOneWidget);
      expect(find.text('36%'), findsOneWidget);
      expect(find.text('Accuracy'), findsOneWidget);
      expect(find.text('15m 45s'), findsOneWidget);
      expect(find.text('Your time'), findsOneWidget);
      expect(find.text('5m 10s'), findsOneWidget);
      expect(find.text('Class average'), findsOneWidget);
      expect(find.text('WHERE YOU SLIPPED'), findsOneWidget);
      expect(find.text('World Hindi Day'), findsOneWidget);
      expect(find.text('Army Day'), findsOneWidget);
      expect(find.text('CONTINUE'), findsOneWidget);
    });

    testWidgets('calls onContinue callback when continue button is tapped', (tester) async {
      bool continueTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: ResultPage(
            monthName: 'January',
            onContinue: () {
              continueTapped = true;
            },
          ),
        ),
      );

      await tester.tap(find.text('CONTINUE'));
      await tester.pumpAndSettle();

      expect(continueTapped, isTrue);
    });
  });
}
