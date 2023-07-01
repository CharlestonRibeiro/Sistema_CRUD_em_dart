import 'package:animal_cli/src/models/animal_model.dart';
import 'package:animal_cli/src/repositories/animal_repository_impl.dart';

class AnimalController {
  final animalRepository = AnimalRepositoryImpl();

  getAllController() async {
    try {
      final List<AnimalModel> listAnimal =
          await animalRepository.getAllAnimals();
      List<String> animalData = [];

      for (var e in listAnimal) {
        animalData
            .add('Nome: ${e.name}, Idade: ${e.age}, Espécie: ${e.species}\n');
      }
      return animalData;
    } catch (e) {
      return 'Erro na chamada';
    }
  }
}
