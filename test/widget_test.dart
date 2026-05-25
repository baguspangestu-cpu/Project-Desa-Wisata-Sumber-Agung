import 'package:flutter_test/flutter_test.dart';
import 'package:projectdesawisata/main.dart';

void main() {
  testWidgets('App loads successfully',
      (WidgetTester tester) async {

    // Jalankan aplikasi
    await tester.pumpWidget(MyApp());

    // Tunggu animasi / splash screen
    await tester.pumpAndSettle();

    // Cek apakah aplikasi berhasil tampil
    expect(find.byType(MyApp), findsOneWidget);
  });
}