import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Ajouter un animal", (WidgetTester tester) async {
    // Lancer l'application
    app.main();
    await tester.pumpAndSettle();

    // Aller à la liste du troupeau
    await tester.tap(find.text("Consulter le troupeau"));
    await tester.pumpAndSettle();

    // Vérifier que la liste est ouverte
    expect(find.text("Liste du troupeau"), findsOneWidget);

    // Cliquer sur le bouton +
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Vérifier que la page d'ajout est ouverte
    expect(find.text("Ajouter un animal"), findsOneWidget);

    // Remplir le formulaire
    await tester.enterText(
      find.widgetWithText(TextFormField, "Numéro de boucle"),
      "BF001",
    );

    await tester.enterText(
      find.widgetWithText(TextFormField, "Espèce"),
      "Bovin",
    );

    await tester.enterText(find.widgetWithText(TextFormField, "Race"), "Zébu");

    // Enregistrer
    await tester.tap(find.text("Enregistrer"));
    await tester.pumpAndSettle();

    // Vérifier le retour à la liste
    expect(find.text("Liste du troupeau"), findsOneWidget);

    // Vérifier que le nouvel animal est affiché
    expect(find.text("BF001"), findsOneWidget);
  });
}
