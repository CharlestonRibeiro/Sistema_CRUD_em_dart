import 'dart:convert';

class AnimalModel {
  final int? id;
  final String name;
  final num age;
  final String species;

  AnimalModel({required this.id, required this.name, required this.age, required this.species});



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'species': species,
    };
  }



  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) => AnimalModel.fromMap(json.decode(source));

   @override
  String toString() {
    return 'AnimalModel{id: $id, name: $name, age: $age, species: $species}';
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      species: map['species'] ?? '',
    );
  }
}
