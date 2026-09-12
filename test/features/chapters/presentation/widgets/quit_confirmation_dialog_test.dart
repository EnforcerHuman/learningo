import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learningo/features/chapters/presentation/widgets/quit_confirmation_dialog.dart';

void main() {
  group('QuitConfirmationDialog Tests', () {
    testWidgets('renders emoji, title, dynamic count, and action buttons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QuitConfirmationDialog(
              completedCount: 10,
              totalCount: 24,
            ),
          ),
        ),
      );

      // Verify title & content
      expect(find.text('✋'), findsOneWidget);
      expect(find.text('Sure you want to quit?'), findsOneWidget);
      expect(
        find.text('10/24 questions ho chuke hain · abhi nikle to ye progress chali jayegi.'),
        findsOneWidget,
      );
      expect(find.text('NO, KEEP PLAYING'), findsOneWidget);
      expect(find.text('YES, QUIT'), findsOneWidget);
    });

    testWidgets('calls onKeepPlaying when NO, KEEP PLAYING is tapped', (tester) async {
      bool keepPlayingCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QuitConfirmationDialog(
              completedCount: 5,
              totalCount: 10,
              onKeepPlaying: () {
                keepPlayingCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('NO, KEEP PLAYING'));
      await tester.pumpAndSettle();

      expect(keepPlayingCalled, isTrue);
    });

    testWidgets('calls onConfirmQuit when YES, QUIT is tapped', (tester) async {
      bool confirmQuitCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QuitConfirmationDialog(
              completedCount: 5,
              totalCount: 10,
              onConfirmQuit: () {
                confirmQuitCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('YES, QUIT'));
      await tester.pumpAndSettle();

      expect(confirmQuitCalled, isTrue);
    });
  });
}
