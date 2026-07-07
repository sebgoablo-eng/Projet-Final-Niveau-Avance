import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Consulter les détails d'un animal", (WidgetTester tester) async {
    // Lancer l'application
    app.main();
    await tester.pumpAndSettle();

    // Aller à la liste du troupeau
    await tester.tap(find.text("Consulter le troupeau"));
    await tester.pumpAndSettle();

    // Vérifier que la liste est affichée
    expect(find.text("Liste du troupeau"), findsOneWidget);

    // Vérifier qu'au moins un animal existe
    expect(find.byType(ListTile), findsWidgets);

    // Ouvrir le premier animal
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();

    // Vérifier que la page des détails est ouverte
    expect(find.text("Détails de l'animal"), findsOneWidget);

    // Vérifier la présence des principales informations
    expect(find.textContaining("Numéro de boucle"), findsOneWidget);
    expect(find.textContaining("Espèce"), findsOneWidget);
    expect(find.textContaining("Race"), findsOneWidget);
    expect(find.textContaining("Sexe"), findsOneWidget);

    // Vérifier la présence des boutons de navigation
    expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);
  });
}
