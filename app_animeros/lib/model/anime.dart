class Anime {
  int id;
  String
      status; // em português: Completei, Assistindo, Parei de assistir, Planejo assistir
  int watchedEpisodes;
  int score;
  String title;
  String imageUrl;
  String date;
  var malId; // não sabemos se esse ID é um int ou String

  Anime(
      {this.id,
      this.status,
      this.watchedEpisodes,
      this.score,
      this.title,
      this.imageUrl,
      this.date,
      this.malId});

  Anime.fromMap(map) {
    this.id = map["id"];
    this.status = map["status"];
    this.watchedEpisodes = map["watchedEpisodes"];
    this.score = map["score"];
    this.title = map["title"];
    this.imageUrl = map["imageUrl"];
    this.date = map["date"];
    this.malId = map["malId"];
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["status"] = status;
    map["watchedEpisodes"] = watchedEpisodes;
    map["score"] = score;
    map["title"] = title;
    map["imageUrl"] = imageUrl;
    map["date"] = date;
    map["malId"] = malId;
    return map;
  }
}
