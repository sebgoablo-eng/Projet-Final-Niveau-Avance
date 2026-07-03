import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Dashboard", (tester) async {
    app.main();

    await tester.pumpAndSettle();

    expect(find.text("Tableau de bord"), findsOneWidget);

    expect(find.text("Nombre total d'animaux"), findsOneWidget);

    expect(find.text("Animaux gestants"), findsOneWidget);

    expect(find.text("Animaux malades"), findsOneWidget);
  });
}
