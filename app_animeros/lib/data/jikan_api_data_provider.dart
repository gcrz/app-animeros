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
    MalAnime anime = MalAnime.fromMap(response.data);
    return anime;
  }

  /*
   * @param year - ano da temporada. Ex: 2020
   * @param season - temporada. Pode ser summer, spring, fall ou winter
   * 
   * @return model Season com as especificações passadas pelos parâmetros
   */
  Future<Season> getSeason(int year, String season) async {
    Dio dio = await dioDataProvider;
    Response response = await dio.request(
        "https://api.jikan.moe/v3/season/${year.toString()}/${season}");

    Season _season = Season(
        year: year, seasonType: season, animeList: response.data['anime']);
    return _season;
  }

  /*
   * @param query - string de consulta de busca. Ex: One piece
   * 
   * @return 
   */
  Future<List> getSearchAsList(String query) async {
    Dio dio = await dioDataProvider;
    var response =
        await dio.request("https://api.jikan.moe/v3/search/anime?q=${query}");
    List animes = [];

    response.data['results'].forEach((element) {
      MalAnime anime = MalAnime.fromMap(element);
      animes.add(anime);
    });

    return animes;
  }
}
