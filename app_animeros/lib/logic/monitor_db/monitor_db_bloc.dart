import 'dart:async';

import 'package:app_animeros/data/firebase_database.dart';
import 'package:app_animeros/logic/monitor_db/monitor_db_event.dart';
import 'package:app_animeros/logic/monitor_db/monitor_db_state.dart';
import 'package:app_animeros/model/anime.dart';
import 'package:bloc/bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  StreamSubscription _firebaseSubscription;
  List<Anime> firebaseAnimeList;

  MonitorBloc(MonitorState initialState) : super(MonitorState(animeList: []));

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) {
    add(AskAllList());

    _firebaseSubscription =
        FirebaseRemoteServer.helper.stream.listen((response) {
      try {
        firebaseAnimeList = response;
        // add()
      } catch (e) {}
    });
  }
}
