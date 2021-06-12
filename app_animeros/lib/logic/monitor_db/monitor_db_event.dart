import 'package:app_animeros/model/anime.dart';

abstract class MonitorEvent {}

class UpdateList extends MonitorEvent {
  List<Anime> animeList;
  UpdateList({this.animeList});
}

class AskAllList extends MonitorEvent {}

class AskWatchedList extends MonitorEvent {}

class AskWatchingList extends MonitorEvent {}

class AskDroppedList extends MonitorEvent {}

class AskPlanList extends MonitorEvent {}

class AskStatistics extends MonitorEvent {}
