import 'animal_controller.dart';

class DashboardController {
  final AnimalController _animalController = AnimalController();

  /// Nombre total d'animaux
  Future<int> totalAnimals() async {
    final animals = await _animalController.getAnimals();

    return animals.length;
  }

  /// Nombre de gestantes
  Future<int> totalGestantes() async {
    final animals = await _animalController.getAnimals();

    return animals
        .where((animal) => animal.statutPhysiologique == "Gestante")
        .length;
  }

  /// Nombre de malades
  Future<int> totalMalades() async {
    final animals = await _animalController.getAnimals();

    return animals.where((animal) => animal.etatSanitaire == "Malade").length;
  }
}
