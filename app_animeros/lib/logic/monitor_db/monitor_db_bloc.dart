import 'dart:async';

import 'package:app_animeros/data/firebase_database.dart';
import 'package:app_animeros/logic/monitor_db/monitor_db_event.dart';
import 'package:app_animeros/logic/monitor_db/monitor_db_state.dart';
import 'package:app_animeros/model/anime.dart';
import 'package:bloc/bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  StreamSubscription _firebaseSubscription;

  List<Anime> firebaseAnimeList;

  MonitorBloc() : super(MonitorState(animeList: [])) {
    add(AskAllList());

    _firebaseSubscription =
        FirebaseRemoteServer.helper.stream.listen((response) {
      try {
        firebaseAnimeList = response;
        add(UpdateList(animeList: List.from(firebaseAnimeList)));
      } catch (e) {}
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskAllList) {
      var firebaseResponse =
          await FirebaseRemoteServer.helper.getAnimeListAll();
      firebaseAnimeList = firebaseResponse;
      yield MonitorState(animeList: List.from(firebaseAnimeList));
    } else if (event is UpdateList) {
      yield MonitorState(animeList: event.animeList);
    }
  }

  close() {
    _firebaseSubscription.cancel();
    return super.close();
  }
}
