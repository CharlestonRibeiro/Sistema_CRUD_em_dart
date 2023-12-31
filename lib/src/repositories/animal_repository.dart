
abstract class AnimalRepository {
  Future putAnimal({required int id, required Map<String, dynamic> data});
  Future postAnimal({required Map<String, dynamic> data});
  Future<List> getAllAnimals();
  Future getById({required int id});
  Future deleteAnimal({required num id});
}