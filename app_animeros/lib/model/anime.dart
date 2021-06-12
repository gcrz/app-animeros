import 'package:app_animeros/constants/enums.dart';

class Anime {
  int id;
  AnimeStatus status;
  int watchedEpisodes;
  int score;
  var malId; // não sabemos se esse ID é um int ou String

  Anime({this.id, this.status, this.watchedEpisodes, this.score, this.malId});

  Anime.fromMap(map) {
    this.id = map["id"];
    this.status = map["status"];
    this.watchedEpisodes = map["watchedEpisodes"];
    this.score = map["score"];
    this.malId = map["malId"];
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["status"] = status;
    map["watchedEpisodes"] = watchedEpisodes;
    map["score"] = score;
    map["malId"] = malId;
    return map;
  }
}
