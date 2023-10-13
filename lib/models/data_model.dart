class DataModel {
  final List<Character> characters;
  final int total;
  final int skip;
  final int limit;

  DataModel({
    required this.characters,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<Character> characterList = (json['results'] as List)
        .map((characterJson) => Character.fromJson(characterJson))
        .toList();

    return DataModel(
      characters: characterList,
      total: json['info']['count'],
      skip: json['info']['offset'],
      limit: json['info']['limit'],
    );
  }
}

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
