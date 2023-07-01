import 'dart:io';
import 'package:animal_cli/src/controllers/animal_controller.dart';

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

          final animalModel = await animalController.datas(insert: true);

          final result =
              await animalController.postController(model: animalModel);
          print(result);
          final dado =
              await animalController.getByIdController(id: animalModel.id ?? 0);
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
          print('Digite o identificador do animal.');

          try {
            final id = int.parse(stdin.readLineSync()!);
            final listAnimal = await animalController.getIdAllController();
            if (listAnimal.contains(id)) {
              final animal = await animalController.getByIdController(id: id);
              print(animal);
              print('Digite os novos dados do animal.');

              final animalModel = await animalController.datas(insert: false);

              final result = await animalController.putController(
                  id: id, model: animalModel);
              print(result);
              final dado = await animalController.getByIdController(
                  id: animalModel.id!);
              print(dado);
            } else {
              print('Identificador invalido');
              break;
            }
          } catch (e) {
            print('Digite um numero!');
            break;
          }

          break;

        default:
          print('Escolha invalida!');
          print('');
          break;
      }
    }
  }
}
