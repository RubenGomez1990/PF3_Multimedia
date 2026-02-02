import 'models.dart';

class TopAnimeResponse {
  Pagination pagination;
  List<Anime> data;

  TopAnimeResponse({
    required this.pagination,
    required this.data,
  });

  factory TopAnimeResponse.fromRawJson(String str) =>
      TopAnimeResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopAnimeResponse.fromJson(Map<String, dynamic> json) =>
      TopAnimeResponse(
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<Anime>.from(json["data"].map((x) => Anime.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
