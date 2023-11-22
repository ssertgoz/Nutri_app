import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<SetUser>(_onSetUser);
  }

  _onSetUser(
    SetUser event,
    Emitter<AppState> emit,
  ) {
    state.userName = event.userNmae;
    emit(state.copyWith());
  }
}
