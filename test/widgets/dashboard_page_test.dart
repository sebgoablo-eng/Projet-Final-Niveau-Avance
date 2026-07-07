import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:agritroupeau/providers/animal_provider.dart';
import 'package:agritroupeau/views/dashboard/dashboard_page.dart';

import '../fakes/fake_animal_controlller.dart';

void main() {
  testWidgets("Dashboard s'affiche correctement", (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AnimalProvider(controller: FakeAnimalController()),

        child: const MaterialApp(home: DashboardPage()),
      ),
    );

    expect(find.text("AgriTroupeau"), findsOneWidget);
  });
}
