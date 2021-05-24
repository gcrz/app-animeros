import 'package:app_animeros/model/profile_info.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  ProfileInfo profileInfo;
  SubmitEvent({this.profileInfo});
}

class UpdateEvent extends ManageEvent {
  ProfileInfo profileInfo;
  int profileId;

  UpdateEvent({this.profileId, this.profileInfo});
}
