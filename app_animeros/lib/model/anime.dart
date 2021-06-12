import 'package:app_animeros/constants/enums.dart';

class Anime {
  int id;
  AnimeStatus status;
  int watchedEpisodes;
  int score;
  var malId; // não sabemos se esse ID é um int ou String

  Anime({this.id, this.status, this.watchedEpisodes, this.score, this.malId});
}
