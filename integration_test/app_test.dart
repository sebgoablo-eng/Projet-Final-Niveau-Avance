import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Lancement de l'application", (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    expect(find.text("Tableau de bord"), findsOneWidget);
  });
}
