import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Vérifier la liste des animaux", (WidgetTester tester) async {
    // Lancer l'application
    app.main();
    await tester.pumpAndSettle();

    // Ouvrir la liste du troupeau
    await tester.tap(find.text("Consulter le troupeau"));
    await tester.pumpAndSettle();

    // Vérifier que la page est ouverte
    expect(find.text("Liste du troupeau"), findsOneWidget);

    // Vérifier qu'au moins une ListTile est présente
    expect(find.byType(ListTile), findsWidgets);

    // Vérifier la présence de l'animal ajouté
    expect(find.text("BF001"), findsOneWidget);

    // Vérifier les boutons Modifier et Supprimer
    expect(find.byIcon(Icons.edit), findsWidgets);
    expect(find.byIcon(Icons.delete), findsWidgets);

    // Vérifier le bouton d'ajout
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
