import 'package:app_animeros/model/anime.dart';

abstract class ManageState {}

class UpdateState extends ManageState {
  var animeId;
  Anime anime;
  UpdateState({this.animeId, this.anime});
}

class InsertState extends ManageState{}
