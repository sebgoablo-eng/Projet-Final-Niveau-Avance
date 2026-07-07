import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Lancement de l'application", (WidgetTester tester) async {
    // Démarrer l'application
    app.main();

    // Attendre le chargement complet
    await tester.pumpAndSettle();

    // Vérifier que l'application est bien lancée
    expect(find.text("AgriTroupeau"), findsOneWidget);

    // Vérifier que la carte de bienvenue est affichée
    expect(find.text("Bienvenue"), findsOneWidget);

    // Vérifier la présence des cartes du tableau de bord
    expect(find.text("Nombre total d'animaux"), findsOneWidget);
    expect(find.text("Animaux gestants"), findsOneWidget);
    expect(find.text("Animaux malades"), findsOneWidget);

    // Vérifier le bouton d'accès à la liste
    expect(find.text("Consulter le troupeau"), findsOneWidget);
  });
}
