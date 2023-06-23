// To parse this JSON data, do
//
//     final genreModel = genreModelFromJson(jsonString);

import 'dart:convert';

GenreModel genreModelFromJson(String str) => GenreModel.fromJson(json.decode(str));

String genreModelToJson(GenreModel data) => json.encode(data.toJson());

class GenreModel {
  String? disambiguation;
  String? id;
  String? name;

  GenreModel({
    this.disambiguation,
    this.id,
    this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
    disambiguation: json["disambiguation"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "disambiguation": disambiguation,
    "id": id,
    "name": name,
  };
}
