import 'package:app_animeros/data/firebase_database.dart';
import 'package:app_animeros/logic/manage_db/manage_db_event.dart';
import 'package:app_animeros/logic/manage_db/manage_db_state.dart';
import 'package:bloc/bloc.dart';

class ManageFirebaseBloc extends Bloc<ManageEvent, ManageState> {
  ManageFirebaseBloc() : super(InsertState());
  
  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async*{
    if (event is UpdateRequest) {
      yield UpdateState(animeId: event.animeId, anime: event.anime);
    } else if (event is UpdateCancel) {
      yield InsertState();
    } else if (event is InsertEvent) {
      if (state is InsertState) {
        FirebaseRemoteServer.helper.insertAnime(event.anime);
      } else if (state is UpdateState) {
        UpdateState updateState = state;
        FirebaseRemoteServer.helper.updateAnime(updateState.animeId, event.anime);
        yield InsertState();
      }
    }
  }
} 
  