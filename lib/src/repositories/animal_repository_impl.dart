import 'package:animal_cli/src/models/animal_model.dart';
import 'package:animal_cli/src/repositories/animal_repository.dart';
import 'package:animal_cli/src/services/dio_client.dart';
import 'package:animal_cli/src/services/rest_client_interface.dart';

class AnimalRepositoryImpl implements AnimalRepository {
  IRestClient dioClient = DioClient();
  final url = 'http://192.168.2.25:8081/animal';

  @override
  Future deleteAimal({required num id}) async {
    await dioClient.deleteData(url: url + id.toString());
  }

  @override
  Future<List<AnimalModel>> getAllAnimals() async {
    final List<dynamic> jsonList = await dioClient.getAllData(url: url);
    List<AnimalModel> animals = jsonList
        .map((json) => AnimalModel.fromMap(json as Map<String, dynamic>))
        .toList();
    return animals;
  }

  @override
  Future postAnimal({required Map<String, dynamic> data}) async {
    await dioClient.postData(url: url, data: data);
  }

  @override
  Future putAnimal({required Map<String, dynamic> data}) async {
    await dioClient.putData(url: url, data: data);
  }
}
