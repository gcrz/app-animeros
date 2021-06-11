import 'package:app_animeros/logic/monitor_db/monitor_db_event.dart';
import 'package:app_animeros/logic/monitor_db/monitor_db_state.dart';
import 'package:bloc/bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState>{
  MonitorBloc(MonitorState initialState) : super(initialState);

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) {
    
  }
}