import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Modifier un animal", (WidgetTester tester) async {
    // Lancer l'application
    app.main();
    await tester.pumpAndSettle();

    // Aller à la liste du troupeau
    await tester.tap(find.text("Consulter le troupeau"));
    await tester.pumpAndSettle();

    // Vérifier que la liste est ouverte
    expect(find.text("Liste du troupeau"), findsOneWidget);

    // Vérifier qu'au moins un animal existe
    expect(find.byType(ListTile), findsWidgets);

    // Cliquer sur le premier bouton Modifier
    await tester.tap(find.byIcon(Icons.edit).first);
    await tester.pumpAndSettle();

    // Vérifier que la page de modification est ouverte
    expect(find.text("Modifier un animal"), findsOneWidget);

    // Modifier le numéro de boucle
    await tester.enterText(
      find.widgetWithText(TextFormField, "Numéro de boucle"),
      "BF001-MOD",
    );

    // Modifier la race
    await tester.enterText(find.widgetWithText(TextFormField, "Race"), "Métis");

    // Enregistrer
    await tester.tap(find.text("Enregistrer"));
    await tester.pumpAndSettle();

    // Retour à la liste
    expect(find.text("Liste du troupeau"), findsOneWidget);

    // Vérifier les modifications
    expect(find.text("BF001-MOD"), findsOneWidget);
    expect(find.textContaining("Métis"), findsOneWidget);
  });
}
