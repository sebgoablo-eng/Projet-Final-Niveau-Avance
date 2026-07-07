import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Navigation entre les différentes pages", (
    WidgetTester tester,
  ) async {
    // Lancer l'application
    app.main();
    await tester.pumpAndSettle();

    // Vérifier que le Dashboard est affiché
    expect(find.text("AgriTroupeau"), findsOneWidget);

    // Aller vers la liste du troupeau
    await tester.tap(find.text("Consulter le troupeau"));
    await tester.pumpAndSettle();

    // Vérifier que la liste est affichée
    expect(find.text("Liste du troupeau"), findsOneWidget);

    // Retour au Dashboard
    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.text("AgriTroupeau"), findsOneWidget);

    // Ouvrir le menu latéral (Drawer)
    await tester.tap(find.byTooltip("Open navigation menu"));
    await tester.pumpAndSettle();

    // Aller à la page Statistiques
    await tester.tap(find.text("Statistiques"));
    await tester.pumpAndSettle();

    // Vérifier que la page Statistiques est ouverte
    expect(find.text("Statistiques"), findsOneWidget);
  });
}
