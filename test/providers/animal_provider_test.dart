import 'package:flutter_test/flutter_test.dart';
import 'package:agritroupeau/providers/animal_provider.dart';

void main() {
  group("AnimalProvider", () {
    late AnimalProvider provider;

    setUp(() {
      provider = AnimalProvider();
    });

    test("Liste vide au démarrage", () {
      expect(provider.animals.length, 0);
    });
  });
}
