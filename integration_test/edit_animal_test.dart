import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Modifier un animal", (tester) async {
    app.main();

    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.edit).first);

    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, "Race *"),
      "Azawak",
    );

    await tester.tap(find.text("Mettre à jour"));

    await tester.pumpAndSettle();

    expect(find.text("Azawak"), findsOneWidget);
  });
}
