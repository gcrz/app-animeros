import 'package:app_animeros/model/anime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRemoteServer {
  static String uid;
  static FirebaseRemoteServer helper = FirebaseRemoteServer._createInstance();
  FirebaseRemoteServer._createInstance();

  final CollectionReference animeList =
      FirebaseFirestore.instance.collection("user");

  //Falta a model Anime
  List _animeListFromSnapshot(QuerySnapshot snapshot) {
    List<Anime> animeList = [];
    // List<String> idList = [];

    for (var doc in snapshot.docs) {
      Anime anime = Anime.fromMap(doc.data());
      animeList.add(anime);
      // idList.add(doc.id);
    }
    // return [animeList, idList];
    // print(animeList[0].malId);
    return animeList;
  }

  // Future<int> insertProfileInfo(Anime anime) async{}

  // Future<int> updateProfileInfo(int profileId, Anime anime) async {}

  insertAnime(Anime anime) async {
    await animeList.doc(uid).collection("my_list").add({
      "malId": anime.malId,
      "status": anime.status,
      "watchedEpisodes": anime.watchedEpisodes,
      "score": anime.score
    });
  }

  updateAnime(int animeId, Anime anime) async {
    await animeList.doc(uid).collection("my_list").doc("$animeId").update({
      "malId": anime.malId,
      "status": anime.status,
      "watchedEpisodes": anime.watchedEpisodes,
      "score": anime.score
    });
  }

  Future<List<Anime>> getAnimeListAll() async {
    QuerySnapshot snapshot =
        await animeList.doc(uid).collection("my_list").get();
    return _animeListFromSnapshot(snapshot);
  }

  Future<int> getAnimeListWatched() async {}

  Future<int> getAnimeListWatching() async {}

  Future<int> getAnimeListDropped() async {}

  Future<int> getAnimeListPlanToWatch() async {}

  Future<int> getUserStatistics() async {}

  // STREAM
  Stream get stream {
    return animeList
        .doc(uid)
        .collection("my_list")
        .snapshots()
        .map(_animeListFromSnapshot);
  }
}
