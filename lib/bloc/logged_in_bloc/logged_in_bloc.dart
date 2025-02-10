import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/data/source/auth_local_service.dart';
import 'package:handy_man/service_locator.dart';
import 'package:meta/meta.dart';

part 'logged_in_event.dart';
part 'logged_in_state.dart';

class LoggedInBloc extends Bloc<LoggedInEvent, LoggedInState> {
  LoggedInBloc() : super(LoggedInInitialState()) {
    on<IsLoggedInEvent>(_onAppStarted);
  }

  _onAppStarted(IsLoggedInEvent event, Emitter<LoggedInState> emit) async {
    var isLoggedIn = await sl<AuthLocalService>().isLoggedIn();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
