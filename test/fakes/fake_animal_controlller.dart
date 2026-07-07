import 'package:agritroupeau/controllers/animal_controller.dart';
import 'package:agritroupeau/models/animal_model.dart';

class FakeAnimalController extends AnimalController {
  @override
  Future<List<Animal>> getAnimals() async {
    return [];
  }

  @override
  Future<int> addAnimal(Animal animal) async => 1;

  @override
  Future<int> updateAnimal(Animal animal) async => 1;

  @override
  Future<int> deleteAnimal(int id) async => 1;
}
