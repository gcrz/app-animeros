import 'package:app_animeros/model/profile_info.dart';

abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {
  List<ProfileInfo> profileInfoList;
  List<int> idList;
  UpdateList({this.profileInfoList, this.idList});
}
