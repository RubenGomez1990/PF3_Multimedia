import 'models.dart';

class Anime {
  int malId;
  String url;
  Map<String, Image> images;
  Trailer trailer;
  bool approved;
  List<Title> titles;
  String title;
  String titleEnglish;
  String titleJapanese;
  List<String> titleSynonyms;
  String type;
  String source;
  int episodes;
  String status;
  bool airing;
  Aired aired;
  String duration;
  String rating;
  double score;
  int scoredBy;
  int rank;
  int popularity;
  int members;
  int favorites;
  String synopsis;
  String background;
  String season;
  int year;
  Broadcast broadcast;
  List<Demographic> producers;
  List<Demographic> licensors;
  List<Demographic> studios;
  List<Demographic> genres;
  List<dynamic> explicitGenres;
  List<Demographic> themes;
  List<Demographic> demographics;

  Anime({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.season,
    required this.year,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  //Creamos un getter algo diferente dado que para acceder a Images es un mapa con más carpetas dentro
  // y establecemos una por defecto si no funciona.
  get fullImagesPath {
    return images['jpg']?.largeImageUrl ??
        'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Anime.fromRawJson(String str) => Anime.fromJson(json.decode(str));

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
        malId: json["mal_id"],
        url: json["url"],
        images: Map.from(json["images"])
            .map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
        trailer: Trailer.fromJson(json["trailer"]),
        approved: json["approved"] ?? false,
        titles: List<Title>.from(json["titles"].map((x) => Title.fromJson(x))),
        title: json["title"] ?? 'No Title',
        titleEnglish: json["title_english"] ?? '',
        titleJapanese: json["title_japanese"] ?? '',
        titleSynonyms: List<String>.from(json["title_synonyms"].map((x) => x)),
        type: json["type"] ?? '',
        source: json["source"] ?? '',
        episodes: json["episodes"] ?? 0,
        status: json["status"] ?? '',
        airing: json["airing"] ?? false,
        aired: Aired.fromJson(json["aired"]),
        duration: json["duration"] ?? '',
        rating: json["rating"] ?? '',
        score: (json["score"] ?? 0.0).toDouble(),
        scoredBy: json["scored_by"] ?? 0,
        rank: json["rank"] ?? 0,
        popularity: json["popularity"] ?? 0,
        members: json["members"] ?? 0,
        favorites: json["favorites"] ?? 0,
        synopsis: json["synopsis"] ?? '',
        background: json["background"] ?? '',
        season: json["season"] ?? '',
        year: json["year"] ?? 0,
        broadcast: Broadcast.fromJson(json["broadcast"] ?? {}),
        producers: List<Demographic>.from(
            json["producers"].map((x) => Demographic.fromJson(x))),
        licensors: List<Demographic>.from(
            json["licensors"].map((x) => Demographic.fromJson(x))),
        studios: List<Demographic>.from(
            json["studios"].map((x) => Demographic.fromJson(x))),
        genres: List<Demographic>.from(
            json["genres"].map((x) => Demographic.fromJson(x))),
        explicitGenres:
            List<dynamic>.from(json["explicit_genres"].map((x) => x)),
        themes: List<Demographic>.from(
            json["themes"].map((x) => Demographic.fromJson(x))),
        demographics: List<Demographic>.from(
            json["demographics"].map((x) => Demographic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": Map.from(images)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "trailer": trailer,
        "approved": approved,
        "titles": List<dynamic>.from(titles.map((x) => x.toJson())),
        "title": title,
        "title_english": titleEnglish,
        "title_japanese": titleJapanese,
        "title_synonyms": List<dynamic>.from(titleSynonyms.map((x) => x)),
        "type": type,
        "source": source,
        "episodes": episodes,
        "status": status,
        "airing": airing,
        "aired": aired,
        "duration": duration,
        "rating": rating,
        "score": score,
        "scored_by": scoredBy,
        "rank": rank,
        "popularity": popularity,
        "members": members,
        "favorites": favorites,
        "synopsis": synopsis,
        "background": background,
        "season": season,
        "year": year,
        "broadcast": broadcast,
        "producers": List<dynamic>.from(producers.map((x) => x.toJson())),
        "licensors": List<dynamic>.from(licensors.map((x) => x.toJson())),
        "studios": List<dynamic>.from(studios.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "explicit_genres": List<dynamic>.from(explicitGenres.map((x) => x)),
        "themes": List<dynamic>.from(themes.map((x) => x.toJson())),
        "demographics": List<dynamic>.from(demographics.map((x) => x.toJson())),
      };
}

class Aired {
  DateTime? from;
  DateTime? to;
  Prop? prop;
  String? string;

  Aired({
    this.from,
    this.to,
    this.prop,
    this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"] == null ? null : DateTime.parse(json["to"]),
        prop: json["prop"] == null ? null : Prop.fromJson(json["prop"]),
        string: json["string"],
      );
}

class Prop {
  From? from;
  From? to;

  Prop({
    this.from,
    this.to,
  });

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: json["from"] == null ? null : From.fromJson(json["from"]),
        to: json["to"] == null ? null : From.fromJson(json["to"]),
      );
}

class From {
  int? day;
  int? month;
  int? year;

  From({
    this.day,
    this.month,
    this.year,
  });

  factory From.fromJson(Map<String, dynamic> json) => From(
        day: json["day"],
        month: json["month"],
        year: json["year"],
      );
}

class Broadcast {
  String? day; // Añadimos ?
  String? time; // Añadimos ?
  String? timezone; // Añadimos ?
  String? string; // Añadimos ?

  Broadcast({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json["day"],
        time: json["time"],
        timezone: json["timezone"],
        string: json["string"],
      );
}

class Demographic {
  int? malId;
  String? type;
  String? name;
  String? url;

  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Demographic.fromRawJson(String str) =>
      Demographic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
        malId: json["mal_id"],
        type: json["type"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "type": type,
        "name": name,
        "url": url,
      };
}

class Image {
  String imageUrl;
  String smallImageUrl;
  String largeImageUrl;

  Image({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
        largeImageUrl: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "large_image_url": largeImageUrl,
      };
}

class Title {
  String type;
  String title;

  Title({
    required this.type,
    required this.title,
  });

  factory Title.fromRawJson(String str) => Title.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
      };
}

class Trailer {
  dynamic youtubeId;
  dynamic url;
  String? embedUrl;
  Images images;

  Trailer({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
    required this.images,
  });

  factory Trailer.fromRawJson(String str) => Trailer.fromJson(json.decode(str));

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
        youtubeId: json["youtube_id"],
        url: json["url"],
        embedUrl: json["embed_url"],
        images: Images.fromJson(json["images"] ?? {}),
      );
}

class Images {
  String? imageUrl; // Cambia a String?
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;
  String? maximumImageUrl;

  Images({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
        maximumImageUrl: json["maximum_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
        "maximum_image_url": maximumImageUrl,
      };
}

class Pagination {
  int lastVisiblePage;
  bool hasNextPage;
  int currentPage;
  Items items;

  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        lastVisiblePage: json["last_visible_page"],
        hasNextPage: json["has_next_page"],
        currentPage: json["current_page"],
        items: Items.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "last_visible_page": lastVisiblePage,
        "has_next_page": hasNextPage,
        "current_page": currentPage,
        "items": items.toJson(),
      };
}

class Items {
  int count;
  int total;
  int perPage;

  Items({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory Items.fromRawJson(String str) => Items.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        count: json["count"],
        total: json["total"],
        perPage: json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "total": total,
        "per_page": perPage,
      };
}
