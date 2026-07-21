import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_portfolio/main.dart';

void main() {
  testWidgets('Portfolio app renders without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.byType(PortfolioApp), findsOneWidget);
  });
}
