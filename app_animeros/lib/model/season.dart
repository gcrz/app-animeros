import 'malAnime.dart';

class Season {
  int year;
  String seasonType; // summer spring fall winter
  List animeList;

  Season({this.animeList, this.seasonType, this.year}) {
    List animesTV = [];
    animeList.forEach((element) {
      if (element['continuing'] == false && element['type'] == 'TV') {
        MalAnime anime = MalAnime.fromMap(element);
        animesTV.add(anime);
      }
    });
    animeList = animesTV;
  }

  @override
  String toString() {
    return "year: ${year}\nseason: ${seasonType}\nanimes: ${animeList.toString()}\n";
  }
}
