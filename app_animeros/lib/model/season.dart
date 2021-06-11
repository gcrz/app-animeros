import 'malAnime.dart';

class Season {
  List animeList;

  Season(List animes) {
    List animesTV = [];
    animes.forEach((element) {
      if (element['continuing'] == false && element['type'] == 'TV') {
        animesTV.add(element);
      }
    });
    animeList = animesTV;
  }

  @override
  String toString() {
    return animeList.toString();
  }
}
