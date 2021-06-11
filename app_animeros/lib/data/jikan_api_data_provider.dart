import 'dart:async';

import 'package:app_animeros/model/malAnime.dart';
import 'package:app_animeros/model/season.dart';
import 'package:dio/dio.dart';

class JikanApiDataProvider {
  static JikanApiDataProvider helper = JikanApiDataProvider._createInstance();
  JikanApiDataProvider._createInstance();

  Dio _dio;

  Future<Dio> get dioDataProvider async {
    if (_dio == null) {
      _dio = Dio();
    }
    return _dio;
  }

  Future<MalAnime> getAnime(int malId) async {
    Dio dio = await dioDataProvider;
    Response response =
        await dio.request("https://api.jikan.moe/v3/anime/${malId}");
    MalAnime anime = MalAnime(
      malId: response.data["malid"],
      title: response.data["title"],
      imageUrl: response.data["image_url"],
      type: response.data["type"],
      airingStart: response.data["airing_start"],
      episodes: response.data["episodes"],
      genres: response.data["genres"],
    );
    return anime;
  }

  /*
   * @param season - temporada. Pode ser summer, spring, fall ou winter
   * 
   */
  Future<Season> getSeason(int year, String season) async {
    Dio dio = await dioDataProvider;
    Response response = await dio.request(
        "https://api.jikan.moe/v3/season/${year.toString()}/${season}");

    Season _season = Season(response.data['anime']);
    return _season;
  }

  Future<List> getSearchAsList(String query) async {
    Dio dio = await dioDataProvider;
    var response =
        await dio.request("https://api.jikan.moe/v3/search/anime?q=${query}");
    List animes = [];

    response.data['results'].forEach((element) {
      MalAnime anime = MalAnime(
        malId: response.data["malid"],
        title: response.data["title"],
        imageUrl: response.data["image_url"],
        type: response.data["type"],
        airingStart: response.data["airing_start"],
        episodes: response.data["episodes"],
        genres: response.data["genres"],
      );
      animes.add(anime);
    });

    return animes;
  }
}

void main() async {
  JikanApiDataProvider provider = JikanApiDataProvider.helper;
  MalAnime anime = await provider.getAnime(12679);
  Season season = await provider.getSeason(2021, 'spring');
  List search = await provider.getSearchAsList('one piece');
  print(anime);
  print(season);
  print(search);
}
