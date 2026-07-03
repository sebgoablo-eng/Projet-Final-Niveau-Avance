import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:agritroupeau/providers/animal_provider.dart';
import 'package:agritroupeau/views/statistics/statistics_page.dart';

void main() {
  testWidgets("Page statistiques", (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AnimalProvider(),

        child: const MaterialApp(home: StatisticsPage()),
      ),
    );

    expect(find.text("Statistiques"), findsOneWidget);
  });
}
