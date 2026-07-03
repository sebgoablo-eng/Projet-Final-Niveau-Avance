import 'package:flutter_test/flutter_test.dart';
import 'package:agritroupeau/models/animal_model.dart';

void main() {
  group("Animal Model", () {
    test("Création d'un animal", () {
      final animal = Animal(
        id: 1,

        numeroBoucle: "BF001",

        espece: "Bovin",

        race: "Goudali",

        sexe: "Femelle",

        couleurRobe: "Blanc",

        dateNaissance: "2024-01-15",

        poids: 250,

        statutPhysiologique: "Gestante",

        etatSanitaire: "Bonne Santé",

        origine: "Acheté",

        numeroBoucleMere: null,

        statutAnimal: "Actif",

        observations: "RAS",
      );

      expect(animal.numeroBoucle, "BF001");

      expect(animal.sexe, "Femelle");

      expect(animal.poids, 250);
    });
  });
}
