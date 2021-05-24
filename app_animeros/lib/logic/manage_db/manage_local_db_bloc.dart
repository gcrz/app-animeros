import 'package:app_animeros/data/local/local_database.dart';
import 'package:app_animeros/logic/manage_db/manage_db_event.dart';
import 'package:app_animeros/logic/manage_db/manage_db_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageLocalBloc extends Bloc<ManageEvent, ManageState> {
  ManageLocalBloc() : super(UpdateState());

  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is SubmitEvent) {
      DatabaseLocalServer.helper.insertProfileInfo(event.profileInfo);
    } else if (event is UpdateEvent) {
      DatabaseLocalServer.helper
          .updateProfileInfo(event.profileId, event.profileInfo);
      yield UpdateState(profileId: event.profileId, oldProfileInfo: event.profileInfo);
    }
  }
}
