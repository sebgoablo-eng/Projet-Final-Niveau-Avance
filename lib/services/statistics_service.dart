import '../models/animal_model.dart';
import 'animal_service.dart';

class StatisticsService {
  final AnimalService _service = AnimalService();

  Future<Map<String, int>> sexe() async {
    final animaux = await _service.getAnimals();

    return _group(animaux, (e) => e.sexe);
  }

  Future<Map<String, int>> espece() async {
    final animaux = await _service.getAnimals();

    return _group(animaux, (e) => e.espece);
  }

  Future<Map<String, int>> race() async {
    final animaux = await _service.getAnimals();

    return _group(animaux, (e) => e.race);
  }

  Future<Map<String, int>> origine() async {
    final animaux = await _service.getAnimals();

    return _group(animaux, (e) => e.origine ?? "Non définie");
  }

  Future<Map<String, int>> etatSanitaire() async {
    final animaux = await _service.getAnimals();

    return _group(animaux, (e) => e.etatSanitaire ?? "Non défini");
  }

  Future<Map<String, int>> statutAnimal() async {
    final animaux = await _service.getAnimals();

    return _group(animaux, (e) => e.statutAnimal ?? "Non défini");
  }

  Future<Map<String, int>> statutPhysiologique() async {
    final animaux = await _service.getAnimals();

    return _group(animaux, (e) => e.statutPhysiologique ?? "Non défini");
  }

  Future<int> totalAnimaux() async {
    return await _service.countAnimals();
  }

  Future<int> totalGestantes() async {
    final animaux = await _service.getAnimals();

    return animaux.where((e) => e.statutPhysiologique == "Gestante").length;
  }

  Future<int> totalMalades() async {
    final animaux = await _service.getAnimals();

    return animaux.where((e) => e.etatSanitaire == "Malade").length;
  }

  Map<String, int> _group(
    List<Animal> animaux,
    String Function(Animal) selector,
  ) {
    final Map<String, int> resultat = {};

    for (final animal in animaux) {
      final key = selector(animal);

      resultat[key] = (resultat[key] ?? 0) + 1;
    }

    return resultat;
  }
}
