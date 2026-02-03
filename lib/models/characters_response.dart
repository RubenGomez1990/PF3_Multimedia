import 'package:movies_app/models/models.dart';

class CharactersResponse {
  List<Datum> data;

  CharactersResponse({
    required this.data,
  });

  factory CharactersResponse.fromRawJson(String str) =>
      CharactersResponse.fromJson(json.decode(str));

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      CharactersResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}
