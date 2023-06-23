
import 'dart:convert';

ArtistModel artistModelFromJson(String str) => ArtistModel.fromJson(json.decode(str));

String artistModelToJson(ArtistModel data) => json.encode(data.toJson());

class ArtistModel {
  String? id;
  String? type;
  String? typeId;
  int? score;
  String? genderId;
  String? name;
  String? sortName;
  String? gender;
  String? country;
  Area? area;
  Area? beginArea;
  String? disambiguation;
  ArtistModelLifeSpan? lifeSpan;
  List<Alias>? aliases;

  ArtistModel({
    this.id,
    this.type,
    this.typeId,
    this.score,
    this.genderId,
    this.name,
    this.sortName,
    this.gender,
    this.country,
    this.area,
    this.beginArea,
    this.disambiguation,
    this.lifeSpan,
    this.aliases,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
    id: json["id"],
    type: json["type"],
    typeId: json["type-id"],
    score: json["score"],
    genderId: json["gender-id"],
    name: json["name"],
    sortName: json["sort-name"],
    gender: json["gender"],
    country: json["country"],
    area: json["area"] == null ? null : Area.fromJson(json["area"]),
    beginArea: json["begin-area"] == null ? null : Area.fromJson(json["begin-area"]),
    disambiguation: json["disambiguation"],
    lifeSpan: json["life-span"] == null ? null : ArtistModelLifeSpan.fromJson(json["life-span"]),
    aliases: json["aliases"] == null ? [] : List<Alias>.from(json["aliases"]!.map((x) => Alias.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "type-id": typeId,
    "score": score,
    "gender-id": genderId,
    "name": name,
    "sort-name": sortName,
    "gender": gender,
    "country": country,
    "area": area?.toJson(),
    "begin-area": beginArea?.toJson(),
    "disambiguation": disambiguation,
    "life-span": lifeSpan?.toJson(),
    "aliases": aliases == null ? [] : List<dynamic>.from(aliases!.map((x) => x.toJson())),
  };
}

class Alias {
  String? sortName;
  String? name;
  dynamic locale;
  String? type;
  dynamic primary;
  dynamic beginDate;
  dynamic endDate;
  String? typeId;

  Alias({
    this.sortName,
    this.name,
    this.locale,
    this.type,
    this.primary,
    this.beginDate,
    this.endDate,
    this.typeId,
  });

  factory Alias.fromJson(Map<String, dynamic> json) => Alias(
    sortName: json["sort-name"],
    name: json["name"],
    locale: json["locale"],
    type: json["type"],
    primary: json["primary"],
    beginDate: json["begin-date"],
    endDate: json["end-date"],
    typeId: json["type-id"],
  );

  Map<String, dynamic> toJson() => {
    "sort-name": sortName,
    "name": name,
    "locale": locale,
    "type": type,
    "primary": primary,
    "begin-date": beginDate,
    "end-date": endDate,
    "type-id": typeId,
  };
}

class Area {
  String? id;
  String? type;
  String? typeId;
  String? name;
  String? sortName;
  AreaLifeSpan? lifeSpan;

  Area({
    this.id,
    this.type,
    this.typeId,
    this.name,
    this.sortName,
    this.lifeSpan,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"],
    type: json["type"],
    typeId: json["type-id"],
    name: json["name"],
    sortName: json["sort-name"],
    lifeSpan: json["life-span"] == null ? null : AreaLifeSpan.fromJson(json["life-span"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "type-id": typeId,
    "name": name,
    "sort-name": sortName,
    "life-span": lifeSpan?.toJson(),
  };
}

class AreaLifeSpan {
  dynamic ended;

  AreaLifeSpan({
    this.ended,
  });

  factory AreaLifeSpan.fromJson(Map<String, dynamic> json) => AreaLifeSpan(
    ended: json["ended"],
  );

  Map<String, dynamic> toJson() => {
    "ended": ended,
  };
}

class ArtistModelLifeSpan {
  String? begin;
  dynamic ended;

  ArtistModelLifeSpan({
    this.begin,
    this.ended,
  });

  factory ArtistModelLifeSpan.fromJson(Map<String, dynamic> json) => ArtistModelLifeSpan(
    begin: json["begin"],
    ended: json["ended"],
  );

  Map<String, dynamic> toJson() => {
    "begin": begin,
    "ended": ended,
  };
}
