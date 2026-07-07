import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:agritroupeau/providers/animal_provider.dart';
import 'package:agritroupeau/views/animal/add_animal_page.dart';

import '../fakes/fake_animal_controlller.dart';

void main() {
  testWidgets("Formulaire ajout animal", (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AnimalProvider(controller: FakeAnimalController()),

        child: const MaterialApp(home: AddAnimalPage()),
      ),
    );

    expect(find.text("Ajouter un animal"), findsOneWidget);
  });
}
