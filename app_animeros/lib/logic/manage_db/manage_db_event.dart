import 'package:app_animeros/model/profile_info.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  ProfileInfo profileInfo;
  SubmitEvent({this.profileInfo});
}
