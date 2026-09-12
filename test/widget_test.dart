import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:learningo/core/di/injection_container.dart';
import 'package:learningo/main.dart';

void main() {
  setUp(() async {
    await GetIt.instance.reset();
    await initInjectionContainer();
  });

  testWidgets('App renders home page with Static GK and Important Days', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Static GK'), findsOneWidget);
    expect(find.text('Important Days'), findsOneWidget);
  });
}
