import 'dart:core';

class MalAnime {
  var malId;
  String title;
  String imageUrl;
  String type; // tv, ova, movie, special, ona, music
  String airingStart;
  int episodes;
  List<dynamic> genres;

  MalAnime(
      {this.malId,
      this.title,
      this.imageUrl,
      this.type,
      this.airingStart,
      this.episodes,
      this.genres});

  MalAnime.fromMap(Map<String, dynamic> map) {
    this.malId = map["mal_id"];
    this.title = map["title"];
    this.imageUrl = map["image_url"];
    this.type = map["type"];
    this.airingStart = map["airing_start"];
    this.episodes = map["episodes"];
    this.genres = map["genres"];
  }

  Map<String, dynamic> toMap() {
    Map malAnimeMap = Map();
    malAnimeMap['mal_id'] = malId;
    malAnimeMap['title'] = title;
    malAnimeMap['image_url'] = imageUrl;
    malAnimeMap['type'] = type;
    malAnimeMap['airing_start'] = airingStart;
    malAnimeMap['episodes'] = episodes;
    malAnimeMap['genres'] = genres;
    return malAnimeMap;
  }

  @override
  String toString() {
    return "title: ${title}\n";
  }
}