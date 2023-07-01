import 'dart:io';

import 'package:animal_cli/src/models/animal_model.dart';
import 'package:animal_cli/src/repositories/animal_repository_impl.dart';

class AnimalController {
  final animalRepository = AnimalRepositoryImpl();

  Future getIdAllController() async {
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

  Future getAllController() async {
    try {
      final List<AnimalModel> listAnimal =
          await animalRepository.getAllAnimals();

      return listAnimal;
    } catch (e) {
      return 'Erro na chamada';
    }
  }

  Future deleteController({required int id}) async {
    try {
      await animalRepository.deleteAnimal(id: id);
      return 'Animal deletado com sucesso!';
    } catch (e) {
      return 'Erro na chamada';
    }
  }

  Future postController({required AnimalModel model}) async {
    try {
      await animalRepository.postAnimal(data: model.toMap());
      return 'Animal inserido com sucesso!';
    } catch (e) {
      return 'Erro na chamada';
    }
  }

  Future putController({required int id, required AnimalModel model}) async {
    try {
      await animalRepository.putAnimal( id: id, data: model.toMap());
      return 'Animal alterado com sucesso!';
    } catch (e) {
      return 'Erro na chamada';
    }
  }


   Future<AnimalModel> datas({required bool insert}) async {
    final List listAnimal = await getIdAllController();
    int? id;

    if (insert == true) {
      if (listAnimal.isEmpty) {
        id = 1;
      } else {
        int maiorNumero = listAnimal
            .reduce((value, element) => value > element ? value : element);
        id = maiorNumero + 1;
      }
    }

    String? name;
    do {
      try {
        print('Digite um nome:');
        name = stdin.readLineSync();
        if (name != null) {
          name = name.trim();
        }
      } catch (e) {
        print('Ocorreu um erro! Tente novamente.');
      }
    } while (name == null || name.isEmpty);

    int? age;
    do {
      try {
        print('Digite a idade:');
        age = int.parse(stdin.readLineSync()!);
      } catch (e) {
        print('Ocorreu um erro! Tente novamente.');
      }
    } while (age == null);

    String? species;
    do {
      try {
        print('Digite a espécie:');
        species = stdin.readLineSync();
        if (species != null) {
          species = species.trim();
        }
      } catch (e) {
        print('Ocorreu um erro! Tente novamente.');
      }
    } while (species == null || species.isEmpty);

    final AnimalModel animalModel =
        AnimalModel(id: id, name: name, age: age, species: species);

    return animalModel;
  }
}
