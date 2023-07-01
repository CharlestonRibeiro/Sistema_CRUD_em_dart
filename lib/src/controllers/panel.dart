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
        case 2:
        case 3:
          final listAnimal = await animalController.getAllController();
          print(listAnimal);
          break;
        case 4:
        case 5:

        default:
          print('Escolha invalida!');
          print('');
          break;
      }
    }
  }
}
