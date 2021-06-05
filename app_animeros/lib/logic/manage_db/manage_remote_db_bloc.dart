import 'package:app_animeros/data/Remote/Remote_database.dart';
import 'package:app_animeros/logic/manage_db/manage_db_event.dart';
import 'package:app_animeros/logic/manage_db/manage_db_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageRemoteBloc extends Bloc<ManageEvent, ManageState> {
  ManageRemoteBloc() : super(InsertState());

  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is SubmitEvent) {
      if (state is InsertState) {
        DatabaseRemoteServer.helper.insertProfileInfo(event.profileInfo);
      }
    }
  }
}
