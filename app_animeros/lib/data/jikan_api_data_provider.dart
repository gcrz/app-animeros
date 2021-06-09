import 'dart:async';

import 'package:jikan_api/jikan_api.dart';

class JikanApiDataProvider {
  static JikanApiDataProvider helper = JikanApiDataProvider._createInstance();
  JikanApiDataProvider._createInstance();

  Jikan _jikanDataProvider;

  Future<Jikan> get jikanDataProvider async {
    if (_jikanDataProvider == null) {
      _jikanDataProvider = Jikan();
    }
    return _jikanDataProvider;
  }

  Future<Anime> getAnime(int malId) async {
    Jikan jikan = await jikanDataProvider;
    Anime anime = await jikan.getAnimeInfo(malId);
    return anime;
  }

  Future<Season> getSeason(int year, SeasonType season) async {
    Jikan jikan = await jikanDataProvider;
    Season _season = await jikan.getSeason(year: year, season: season);
    return _season;
  }

  Future<List> getSearchAsList(String query) async {
    Jikan jikan = await jikanDataProvider;
    var search = await jikan.search(query, SearchType.anime);
    return search.asList();
  }
}
