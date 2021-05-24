import 'dart:async';

import 'package:app_animeros/logic/monitor_db/monitor_db_event.dart';
import 'package:app_animeros/logic/monitor_db/monitor_db_state.dart';
import 'package:app_animeros/data/local/local_database.dart';
import 'package:app_animeros/model/profile_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {

    StreamSubscription _localSubscription;

    MonitorBloc() : super(MonitorState(profileInfoList: [], idList: [])) {
    add(AskNewList());
    _localSubscription = DatabaseLocalServer.helper.stream.listen((response) {
      try {
        List<ProfileInfo> localProfileInfoList = response[0];
        List<int> localIdList = response[1];
        add(UpdateList(profileInfoList: localProfileInfoList, idList: localIdList));
      } catch (e) {}
    });
    }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async*{
    if (event is AskNewList) {
      var response = await DatabaseLocalServer.helper.getProfileList();
      List<ProfileInfo> localProfileInfoList = response[0];
      List<int> localIdList = response[1];
      yield MonitorState(idList: localIdList, profileInfoList: localProfileInfoList);
    } else if (event is UpdateList) {
      yield MonitorState(idList: event.idList, profileInfoList: event.profileInfoList);
    }
  }

  close() {
    _localSubscription.cancel();
    return super.close();
  }
    
}