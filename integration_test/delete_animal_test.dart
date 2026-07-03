import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:agritroupeau/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Supprimer un animal", (tester) async {
    app.main();

    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.delete).first);

    await tester.pumpAndSettle();

    await tester.tap(find.text("Supprimer"));

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.delete), findsWidgets);
  });
}
