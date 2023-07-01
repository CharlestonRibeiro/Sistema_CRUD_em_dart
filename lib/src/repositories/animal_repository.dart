import 'package:animal_cli/src/models/animal_model.dart';

abstract class AnimalRepository {
  Future putAnimal({required Map<String, dynamic> data});
  Future postAnimal({required Map<String, dynamic> data});
  Future<List> getAllAnimals();
  Future deleteAimal({required num id});
}