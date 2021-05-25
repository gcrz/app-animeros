import 'package:app_animeros/model/profile_info.dart';

abstract class ManageState {}

class UpdateState extends ManageState {
  int profileId;
  ProfileInfo oldProfileInfo;
  UpdateState({this.profileId, this.oldProfileInfo});
}

class InsertState extends ManageState {}
