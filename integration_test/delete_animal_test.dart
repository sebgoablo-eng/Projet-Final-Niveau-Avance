import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Supprimer un animal", (WidgetTester tester) async {
    // Lancer l'application
    app.main();
    await tester.pumpAndSettle();

    // Aller à la liste du troupeau
    await tester.tap(find.text("Consulter le troupeau"));
    await tester.pumpAndSettle();

    // Vérifier que la page est ouverte
    expect(find.text("Liste du troupeau"), findsOneWidget);

    // Vérifier qu'il existe au moins un animal
    expect(find.byType(ListTile), findsWidgets);

    // Cliquer sur le premier bouton Supprimer
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pumpAndSettle();

    // Vérifier que la boîte de dialogue est affichée
    expect(find.text("Confirmation"), findsOneWidget);

    // Confirmer la suppression
    await tester.tap(find.text("Supprimer"));
    await tester.pumpAndSettle();

    // Vérifier le message de succès
    expect(find.text("Animal supprimé avec succès."), findsOneWidget);
  });
}
