import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:agritroupeau/providers/animal_provider.dart';
import 'package:agritroupeau/views/animal/animal_list_page.dart';

import '../fakes/fake_animal_controlller.dart';

void main() {
  testWidgets("Liste des animaux", (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AnimalProvider(controller: FakeAnimalController()),

        child: const MaterialApp(home: AnimalListPage()),
      ),
    );

    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
