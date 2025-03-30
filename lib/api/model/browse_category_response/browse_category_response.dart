/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

BrowseCategoryResponse browseCategoryResponseFromJson(String str) =>
    BrowseCategoryResponse.fromJson(json.decode(str));

String browseCategoryResponseToJson(BrowseCategoryResponse data) =>
    json.encode(data.toJson());

class BrowseCategoryResponse {
  BrowseCategoryResponse({required this.genres});

  List<Genre> genres;

  factory BrowseCategoryResponse.fromJson(Map<dynamic, dynamic> json) =>
      BrowseCategoryResponse(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
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
