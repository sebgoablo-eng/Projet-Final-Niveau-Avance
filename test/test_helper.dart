import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:agritroupeau/providers/animal_provider.dart';

class TestHelper {
  /// Widget de base pour les tests
  static Widget createTestApp(Widget child) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AnimalProvider>(create: (_) => AnimalProvider()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: child),
    );
  }

  /// Vide les animations en attente
  static Future<void> pumpAndSettle(WidgetTester tester, Widget widget) async {
    await tester.pumpWidget(createTestApp(widget));

    await tester.pumpAndSettle();
  }
}
