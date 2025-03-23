/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

MoviesDetailsResponse moviesDetailsResponseFromJson(String str) =>
    MoviesDetailsResponse.fromJson(json.decode(str));

String moviesDetailsResponseToJson(MoviesDetailsResponse data) =>
    json.encode(data.toJson());

class MoviesDetailsResponse {
  MoviesDetailsResponse({
    required this.originalLanguage,
    required this.imdbId,
    required this.video,
    required this.title,
    required this.backdropPath,
    required this.revenue,
    required this.genres,
    required this.popularity,
    required this.productionCountries,
    required this.id,
    required this.voteCount,
    required this.budget,
    required this.overview,
    required this.originalTitle,
    required this.runtime,
    required this.posterPath,
    required this.originCountry,
    required this.spokenLanguages,
    required this.productionCompanies,
    required this.releaseDate,
    required this.voteAverage,
    required this.tagline,
    required this.adult,
    required this.homepage,
    required this.status,
  });

  String originalLanguage;
  String imdbId;
  bool video;
  String title;
  String backdropPath;
  int revenue;
  List<Genre> genres;
  double popularity;
  List<ProductionCountry> productionCountries;
  int id;
  int voteCount;
  int budget;
  String overview;
  String originalTitle;
  int runtime;
  String posterPath;
  List<String> originCountry;
  List<SpokenLanguage> spokenLanguages;
  List<ProductionCompany> productionCompanies;
  DateTime releaseDate;
  double voteAverage;
  String tagline;
  bool adult;
  String homepage;
  String status;

  factory MoviesDetailsResponse.fromJson(
    Map<dynamic, dynamic> json,
  ) => MoviesDetailsResponse(
    originalLanguage: json["original_language"],
    imdbId: json["imdb_id"],
    video: json["video"],
    title: json["title"],
    backdropPath: json["backdrop_path"],
    revenue: json["revenue"],
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    popularity: json["popularity"]?.toDouble(),
    productionCountries: List<ProductionCountry>.from(
      json["production_countries"].map((x) => ProductionCountry.fromJson(x)),
    ),
    id: json["id"],
    voteCount: json["vote_count"],
    budget: json["budget"],
    overview: json["overview"],
    originalTitle: json["original_title"],
    runtime: json["runtime"],
    posterPath: json["poster_path"],
    originCountry: List<String>.from(json["origin_country"].map((x) => x)),
    spokenLanguages: List<SpokenLanguage>.from(
      json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x)),
    ),
    productionCompanies: List<ProductionCompany>.from(
      json["production_companies"].map((x) => ProductionCompany.fromJson(x)),
    ),
    releaseDate: DateTime.parse(json["release_date"]),
    voteAverage: json["vote_average"]?.toDouble(),
    tagline: json["tagline"],
    adult: json["adult"],
    homepage: json["homepage"],
    status: json["status"],
  );

  Map<dynamic, dynamic> toJson() => {
    "original_language": originalLanguage,
    "imdb_id": imdbId,
    "video": video,
    "title": title,
    "backdrop_path": backdropPath,
    "revenue": revenue,
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "popularity": popularity,
    "production_countries": List<dynamic>.from(
      productionCountries.map((x) => x.toJson()),
    ),
    "id": id,
    "vote_count": voteCount,
    "budget": budget,
    "overview": overview,
    "original_title": originalTitle,
    "runtime": runtime,
    "poster_path": posterPath,
    "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
    "spoken_languages": List<dynamic>.from(
      spokenLanguages.map((x) => x.toJson()),
    ),
    "production_companies": List<dynamic>.from(
      productionCompanies.map((x) => x.toJson()),
    ),
    "release_date":
        "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "vote_average": voteAverage,
    "tagline": tagline,
    "adult": adult,
    "homepage": homepage,
    "status": status,
  };
}

class Genre {
  Genre({required this.name, required this.id});

  String name;
  int id;

  factory Genre.fromJson(Map<dynamic, dynamic> json) =>
      Genre(name: json["name"], id: json["id"]);

  Map<dynamic, dynamic> toJson() => {"name": name, "id": id};
}

class ProductionCompany {
  ProductionCompany({
    required this.name,
    required this.id,
    required this.originCountry,
  });

  String name;
  int id;
  String originCountry;

  factory ProductionCompany.fromJson(Map<dynamic, dynamic> json) =>
      ProductionCompany(
        name: json["name"],
        id: json["id"],
        originCountry: json["origin_country"],
      );

  Map<dynamic, dynamic> toJson() => {
    "name": name,
    "id": id,
    "origin_country": originCountry,
  };
}

class ProductionCountry {
  ProductionCountry({required this.iso31661, required this.name});

  String iso31661;
  String name;

  factory ProductionCountry.fromJson(Map<dynamic, dynamic> json) =>
      ProductionCountry(iso31661: json["iso_3166_1"], name: json["name"]);

  Map<dynamic, dynamic> toJson() => {"iso_3166_1": iso31661, "name": name};
}

class SpokenLanguage {
  SpokenLanguage({
    required this.name,
    required this.iso6391,
    required this.englishName,
  });

  String name;
  String iso6391;
  String englishName;

  factory SpokenLanguage.fromJson(Map<dynamic, dynamic> json) => SpokenLanguage(
    name: json["name"],
    iso6391: json["iso_639_1"],
    englishName: json["english_name"],
  );

  Map<dynamic, dynamic> toJson() => {
    "name": name,
    "iso_639_1": iso6391,
    "english_name": englishName,
  };
}
