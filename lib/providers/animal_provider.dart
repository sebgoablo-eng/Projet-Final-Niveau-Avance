import 'package:flutter/material.dart';

import '../controllers/animal_controller.dart';
import '../models/animal_model.dart';

class AnimalProvider extends ChangeNotifier {
  final AnimalController _controller = AnimalController();

  List<Animal> _animals = [];

  bool _isLoading = false;

  List<Animal> get animals => _animals;

  bool get isLoading => _isLoading;

  /// Charger tous les animaux
  Future<void> loadAnimals() async {
    _isLoading = true;
    notifyListeners();

    _animals = await _controller.getAnimals();

    _isLoading = false;
    notifyListeners();
  }

  /// Ajouter un animal
  Future<bool> addAnimal(Animal animal) async {
    try {
      await _controller.addAnimal(animal);

      await loadAnimals();

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Modifier un animal
  Future<bool> updateAnimal(Animal animal) async {
    try {
      await _controller.updateAnimal(animal);

      await loadAnimals();

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Supprimer un animal
  Future<bool> deleteAnimal(int id) async {
    try {
      await _controller.deleteAnimal(id);

      await loadAnimals();

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Rechercher un animal par son ID
  Animal? getAnimalById(int id) {
    try {
      return _animals.firstWhere((animal) => animal.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Nombre total d'animaux
  int get totalAnimals => _animals.length;

  /// Nombre de gestantes
  int get totalGestantes => _animals
      .where((animal) => animal.statutPhysiologique == "Gestante")
      .length;

  /// Nombre de malades
  int get totalMalades =>
      _animals.where((animal) => animal.etatSanitaire == "Malade").length;

  /// Répartition par sexe
  Map<String, int> get sexeStatistics {
    final Map<String, int> result = {};

    for (var animal in _animals) {
      result[animal.sexe] = (result[animal.sexe] ?? 0) + 1;
    }

    return result;
  }

  /// Répartition par espèce
  Map<String, int> get especeStatistics {
    final Map<String, int> result = {};

    for (var animal in _animals) {
      result[animal.espece] = (result[animal.espece] ?? 0) + 1;
    }

    return result;
  }

  /// Répartition par race
  Map<String, int> get raceStatistics {
    final Map<String, int> result = {};

    for (var animal in _animals) {
      result[animal.race] = (result[animal.race] ?? 0) + 1;
    }

    return result;
  }

  /// Répartition par état sanitaire
  Map<String, int> get etatSanitaireStatistics {
    final Map<String, int> result = {};

    for (var animal in _animals) {
      final key = animal.etatSanitaire ?? "Non défini";

      result[key] = (result[key] ?? 0) + 1;
    }

    return result;
  }

  /// Répartition par origine
  Map<String, int> get origineStatistics {
    final Map<String, int> result = {};

    for (var animal in _animals) {
      final key = animal.origine ?? "Non définie";

      result[key] = (result[key] ?? 0) + 1;
    }

    return result;
  }

  /// Répartition par statut physiologique
  Map<String, int> get statutPhysiologiqueStatistics {
    final Map<String, int> result = {};

    for (var animal in _animals) {
      final key = animal.statutPhysiologique ?? "Non défini";

      result[key] = (result[key] ?? 0) + 1;
    }

    return result;
  }

  /// Répartition par statut de l'animal
  Map<String, int> get statutAnimalStatistics {
    final Map<String, int> result = {};

    for (var animal in _animals) {
      final key = animal.statutAnimal ?? "Non défini";

      result[key] = (result[key] ?? 0) + 1;
    }

    return result;
  }

  /// Actualiser les données
  Future<void> refresh() async {
    await loadAnimals();
  }

  /// Vider les données en mémoire
  void clear() {
    _animals.clear();
    notifyListeners();
  }
}
