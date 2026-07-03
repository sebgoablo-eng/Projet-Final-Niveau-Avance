import '../database/database_helper.dart';
import '../database/tables.dart';
import '../models/animal_model.dart';

class AnimalController {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  /// Ajouter un animal
  Future<int> addAnimal(Animal animal) async {
    return await _databaseHelper.insert(DBTables.animalTable, animal.toMap());
  }

  /// Liste de tous les animaux
  Future<List<Animal>> getAnimals() async {
    final data = await _databaseHelper.queryAll(DBTables.animalTable);

    return data.map((e) => Animal.fromMap(e)).toList();
  }

  /// Rechercher un animal par son ID
  Future<Animal?> getAnimalById(int id) async {
    final data = await _databaseHelper.queryById(DBTables.animalTable, id);

    if (data == null) {
      return null;
    }

    return Animal.fromMap(data);
  }

  /// Modifier un animal
  Future<int> updateAnimal(Animal animal) async {
    return await _databaseHelper.update(
      DBTables.animalTable,
      animal.toMap(),
      animal.id!,
    );
  }

  /// Supprimer un animal
  Future<int> deleteAnimal(int id) async {
    return await _databaseHelper.delete(DBTables.animalTable, id);
  }
}
