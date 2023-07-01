import 'dart:io';
import 'package:animal_cli/src/controllers/animal_controller.dart';
import 'package:animal_cli/src/models/animal_model.dart';

class Panel {
  final animalController = AnimalController();

  int? choice;

  final menu = '''

            Painel de controle:

            1 - Cadastrar uma novo animal;
            2 - Buscar um animal;
            3 - Buscar todos os animal;
            4 - Deletar animal;
            5 - Edital animal
            0 - sair
          ''';

  Future<void> panelController() async {
    while (choice != 0) {
      print(menu);

      try {
        choice = int.parse(stdin.readLineSync()!);
      } catch (e) {
        choice == 6;
      }

      switch (choice) {
        case 0:
        case 1:
          print('Digite os dados do animal.');

          final List listAnimal = await animalController.getIdAllController();

          int? id;
          if (listAnimal.isEmpty) {
            id = 1;
          } else {
            int maiorNumero = listAnimal
                .reduce((value, element) => value > element ? value : element);
            id = maiorNumero + 1;
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

          final result =
              await animalController.postController(model: animalModel);
          print(result);
          final dado = await animalController.getByIdController(id: id);
          print(dado);

          break;

        case 2:
          print('Digite o identificador do animal.');

          try {
            final id = int.parse(stdin.readLineSync()!);
            final listAnimal = await animalController.getIdAllController();
            if (listAnimal.contains(id)) {
              final animal = await animalController.getByIdController(id: id);
              print(animal);
            } else {
              print('Identificador invalido');
            }
          } catch (e) {
            print('Digite um numero!');
          }

          break;

        case 3:
          final listAnimal = await animalController.getAllController();

          if (listAnimal.isEmpty) {
            print('Não existe dados cadastrados');
          } else if (listAnimal == 'Erro na chamada') {
            print(listAnimal);
          } else {
            for (var e in listAnimal) {
              print(
                  'Nome: ${e.name}, Idade: ${e.age}, Espécie: ${e.species}, Identificador: ${e.id}');
            }
          }

          break;
        case 4:
          print('Digite o identificador do animal para deletado.');

          try {
            final id = int.parse(stdin.readLineSync()!);
            final listAnimal = await animalController.getIdAllController();
            if (listAnimal.contains(id)) {
              final result = await animalController.deleteController(id: id);
              print(result);
            } else {
              print('Identificador invalido');
            }
          } catch (e) {
            print('Digite um numero!');
          }

          break;
        case 5:

        default:
          print('Escolha invalida!');
          print('');
          break;
      }
    }
  }
}
