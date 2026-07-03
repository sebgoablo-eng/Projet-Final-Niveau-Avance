import '../models/animal_model.dart';
import 'animal_controller.dart';

class StatisticsController {
  final AnimalController _animalController = AnimalController();

  Future<Map<String, int>> groupBySexe() async {
    final animaux = await _animalController.getAnimals();

    return _group(animaux, (a) => a.sexe);
  }

  Future<Map<String, int>> groupByEspece() async {
    final animaux = await _animalController.getAnimals();

    return _group(animaux, (a) => a.espece);
  }

  Future<Map<String, int>> groupByRace() async {
    final animaux = await _animalController.getAnimals();

    return _group(animaux, (a) => a.race);
  }

  Future<Map<String, int>> groupByStatut() async {
    final animaux = await _animalController.getAnimals();

    return _group(animaux, (a) => a.statutAnimal ?? "Non défini");
  }

  Future<Map<String, int>> groupByOrigine() async {
    final animaux = await _animalController.getAnimals();

    return _group(animaux, (a) => a.origine ?? "Non définie");
  }

  Future<Map<String, int>> groupByEtatSanitaire() async {
    final animaux = await _animalController.getAnimals();

    return _group(animaux, (a) => a.etatSanitaire ?? "Non défini");
  }

  Future<Map<String, int>> groupByStatutPhysiologique() async {
    final animaux = await _animalController.getAnimals();

    return _group(animaux, (a) => a.statutPhysiologique ?? "Non défini");
  }

  Map<String, int> _group(
    List<Animal> animaux,
    String Function(Animal) selector,
  ) {
    final Map<String, int> resultat = {};

    for (var animal in animaux) {
      final cle = selector(animal);

      resultat[cle] = (resultat[cle] ?? 0) + 1;
    }

    return resultat;
  }
}
