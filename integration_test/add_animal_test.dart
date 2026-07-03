import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Ajouter un animal", (tester) async {
    app.main();

    await tester.pumpAndSettle();

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, "Numéro de boucle *"),
      "BF1001",
    );

    await tester.enterText(
      find.widgetWithText(TextFormField, "Espèce *"),
      "Bovin",
    );

    await tester.enterText(
      find.widgetWithText(TextFormField, "Race *"),
      "Goudali",
    );

    await tester.tap(find.text("Enregistrer"));

    await tester.pumpAndSettle();

    expect(find.text("BF1001"), findsOneWidget);
  });
}
