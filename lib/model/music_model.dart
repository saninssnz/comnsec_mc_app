// To parse this JSON data, do
//
//     final musicModel = musicModelFromJson(jsonString);

import 'dart:convert';

MusicModel musicModelFromJson(String str) => MusicModel.fromJson(json.decode(str));

String musicModelToJson(MusicModel data) => json.encode(data.toJson());

class MusicModel {
  String? id;
  int? score;
  String? title;
  int? length;
  dynamic video;
  List<ArtistCredit>? artistCredit;
  List<Release>? releases;

  MusicModel({
    this.id,
    this.score,
    this.title,
    this.length,
    this.video,
    this.artistCredit,
    this.releases,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
    id: json["id"],
    score: json["score"],
    title: json["title"],
    length: json["length"],
    video: json["video"],
    artistCredit: json["artist-credit"] == null ? [] : List<ArtistCredit>.from(json["artist-credit"]!.map((x) => ArtistCredit.fromJson(x))),
    releases: json["releases"] == null ? [] : List<Release>.from(json["releases"]!.map((x) => Release.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "score": score,
    "title": title,
    "length": length,
    "video": video,
    "artist-credit": artistCredit == null ? [] : List<dynamic>.from(artistCredit!.map((x) => x.toJson())),
    "releases": releases == null ? [] : List<dynamic>.from(releases!.map((x) => x.toJson())),
  };
}

class ArtistCredit {
  String? name;
  Artist? artist;

  ArtistCredit({
    this.name,
    this.artist,
  });

  factory ArtistCredit.fromJson(Map<String, dynamic> json) => ArtistCredit(
    name: json["name"],
    artist: json["artist"] == null ? null : Artist.fromJson(json["artist"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "artist": artist?.toJson(),
  };
}

class Artist {
  String? id;
  String? name;
  String? sortName;
  String? disambiguation;

  Artist({
    this.id,
    this.name,
    this.sortName,
    this.disambiguation,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
    id: json["id"],
    name: json["name"],
    sortName: json["sort-name"],
    disambiguation: json["disambiguation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sort-name": sortName,
    "disambiguation": disambiguation,
  };
}

class Release {
  String? id;
  String? statusId;
  int? count;
  String? title;
  String? status;
  ReleaseGroup? releaseGroup;
  int? trackCount;
  List<Media>? media;

  Release({
    this.id,
    this.statusId,
    this.count,
    this.title,
    this.status,
    this.releaseGroup,
    this.trackCount,
    this.media,
  });

  factory Release.fromJson(Map<String, dynamic> json) => Release(
    id: json["id"],
    statusId: json["status-id"],
    count: json["count"],
    title: json["title"],
    status: json["status"],
    releaseGroup: json["release-group"] == null ? null : ReleaseGroup.fromJson(json["release-group"]),
    trackCount: json["track-count"],
    media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status-id": statusId,
    "count": count,
    "title": title,
    "status": status,
    "release-group": releaseGroup?.toJson(),
    "track-count": trackCount,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
  };
}

class Media {
  int? position;
  List<Track>? track;
  int? trackCount;
  int? trackOffset;

  Media({
    this.position,
    this.track,
    this.trackCount,
    this.trackOffset,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    position: json["position"],
    track: json["track"] == null ? [] : List<Track>.from(json["track"]!.map((x) => Track.fromJson(x))),
    trackCount: json["track-count"],
    trackOffset: json["track-offset"],
  );

  Map<String, dynamic> toJson() => {
    "position": position,
    "track": track == null ? [] : List<dynamic>.from(track!.map((x) => x.toJson())),
    "track-count": trackCount,
    "track-offset": trackOffset,
  };
}

class Track {
  String? id;
  String? number;
  String? title;
  int? length;

  Track({
    this.id,
    this.number,
    this.title,
    this.length,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    id: json["id"],
    number: json["number"],
    title: json["title"],
    length: json["length"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "title": title,
    "length": length,
  };
}

class ReleaseGroup {
  String? id;
  String? typeId;
  String? primaryTypeId;
  String? title;
  String? primaryType;
  List<String>? secondaryTypes;
  List<String>? secondaryTypeIds;

  ReleaseGroup({
    this.id,
    this.typeId,
    this.primaryTypeId,
    this.title,
    this.primaryType,
    this.secondaryTypes,
    this.secondaryTypeIds,
  });

  factory ReleaseGroup.fromJson(Map<String, dynamic> json) => ReleaseGroup(
    id: json["id"],
    typeId: json["type-id"],
    primaryTypeId: json["primary-type-id"],
    title: json["title"],
    primaryType: json["primary-type"],
    secondaryTypes: json["secondary-types"] == null ? [] : List<String>.from(json["secondary-types"]!.map((x) => x)),
    secondaryTypeIds: json["secondary-type-ids"] == null ? [] : List<String>.from(json["secondary-type-ids"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type-id": typeId,
    "primary-type-id": primaryTypeId,
    "title": title,
    "primary-type": primaryType,
    "secondary-types": secondaryTypes == null ? [] : List<dynamic>.from(secondaryTypes!.map((x) => x)),
    "secondary-type-ids": secondaryTypeIds == null ? [] : List<dynamic>.from(secondaryTypeIds!.map((x) => x)),
  };
}
