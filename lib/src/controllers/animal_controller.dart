import 'package:animal_cli/src/models/animal_model.dart';
import 'package:animal_cli/src/repositories/animal_repository_impl.dart';

class AnimalController {
  final animalRepository = AnimalRepositoryImpl();

  getIdAllController() async {
    try {
      final List<AnimalModel> listAnimal =
          await animalRepository.getAllAnimals();

      List listId = [];

      for (var e in listAnimal) {
        listId.add(e.id);
      }

      return listId;
    } catch (e) {
      return 'Erro na chamada';
    }
  }

 Future<String> getByIdController({required int id}) async {
  try {
    final AnimalModel animal = await animalRepository.getById(id: id);
    String animalData =
        'Nome: ${animal.name}, Idade: ${animal.age}, Espécie: ${animal.species}, Identificador: ${animal.id}';

    return animalData;
  } catch (e, s) {
    print('Exception: $e\nStacktrace: $s');
    return 'Erro na chamada';
  }
}

  getAllController() async {
    try {
      final List<AnimalModel> listAnimal =
          await animalRepository.getAllAnimals();

      return listAnimal;
    } catch (e) {
      return 'Erro na chamada';
    }
  }
}
