import 'package:flutter_test/flutter_test.dart';
import 'package:projectdesawisata/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const DesaWisataApp());
    expect(find.text('0'), findsNothing);
  });
}