import 'package:movies_app/models/models.dart';

class Datum {
  Character character;
  Role role;

  Datum({required this.character, required this.role});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        character: Character.fromJson(json["character"]),
        role: roleValues.map[json["role"]] ?? Role.SUPPORTING,
      );
}

class Character {
  int malId;
  CharacterImages images;
  String name;

  Character({required this.malId, required this.images, required this.name});

  get fullProfilePath => images.jpg.imageUrl;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        malId: json["mal_id"],
        images: CharacterImages.fromJson(json["images"]),
        name: json["name"],
      );
}

class CharacterImages {
  Jpg jpg;
  CharacterImages({required this.jpg});

  factory CharacterImages.fromJson(Map<String, dynamic> json) =>
      CharacterImages(
        jpg: Jpg.fromJson(json["jpg"]),
      );
}

class Jpg {
  String imageUrl;
  Jpg({required this.imageUrl});

  factory Jpg.fromJson(Map<String, dynamic> json) =>
      Jpg(imageUrl: json["image_url"]);
}

enum Role { MAIN, SUPPORTING }

final roleValues =
    EnumValues({"Main": Role.MAIN, "Supporting": Role.SUPPORTING});
