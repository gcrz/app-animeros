import 'package:app_animeros/data/local/local_database.dart';
import 'package:app_animeros/logic/manage_db/manage_db_event.dart';
import 'package:app_animeros/logic/manage_db/manage_db_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageLocalBloc extends Bloc<ManageEvent, ManageState> {
  ManageLocalBloc() : super(InsertState());

  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is SubmitEvent) {
      if (state is InsertState) {
        DatabaseLocalServer.helper.insertProfileInfo(event.profileInfo);
      } else if (state is UpdateState) {
        UpdateState updateState = state;
        DatabaseLocalServer.helper
            .updateProfileInfo(updateState.profileId, event.profileInfo);
        yield InsertState();
      }
      DatabaseLocalServer.helper.insertProfileInfo(event.profileInfo);
    } else if (event is UpdateEvent) {
      yield UpdateState(
          profileId: event.profileId, oldProfileInfo: event.profileInfo);
    }
  }
}
