import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Page statistiques", (tester) async {
    app.main();

    await tester.pumpAndSettle();

    await tester.tap(find.text("Statistiques"));

    await tester.pumpAndSettle();

    expect(find.text("Statistiques"), findsOneWidget);
  });
}
