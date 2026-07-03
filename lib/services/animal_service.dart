import '../database/database_helper.dart';
import '../database/tables.dart';
import '../models/animal_model.dart';

class AnimalService {
  final DatabaseHelper _database = DatabaseHelper.instance;

  /// Ajouter un animal
  Future<int> addAnimal(Animal animal) async {
    return await _database.insert(DBTables.animalTable, animal.toMap());
  }

  /// Liste des animaux
  Future<List<Animal>> getAnimals() async {
    final result = await _database.queryAll(DBTables.animalTable);

    return result.map((e) => Animal.fromMap(e)).toList();
  }

  /// Animal par ID
  Future<Animal?> getAnimalById(int id) async {
    final result = await _database.queryById(DBTables.animalTable, id);

    if (result == null) {
      return null;
    }

    return Animal.fromMap(result);
  }

  /// Modification
  Future<int> updateAnimal(Animal animal) async {
    return await _database.update(
      DBTables.animalTable,
      animal.toMap(),
      animal.id!,
    );
  }

  /// Suppression
  Future<int> deleteAnimal(int id) async {
    return await _database.delete(DBTables.animalTable, id);
  }

  /// Vérifier si un numéro de boucle existe
  Future<bool> boucleExiste(String numeroBoucle) async {
    final animaux = await getAnimals();

    return animaux.any((animal) => animal.numeroBoucle == numeroBoucle);
  }

  /// Nombre total
  Future<int> countAnimals() async {
    final animaux = await getAnimals();

    return animaux.length;
  }
}
