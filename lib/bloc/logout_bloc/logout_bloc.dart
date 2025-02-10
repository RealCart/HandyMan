import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/data/source/auth_local_service.dart';
import 'package:handy_man/service_locator.dart';
import 'package:meta/meta.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitialState()) {
    on<LoggingOutEvent>(_onLogout);
  }

  _onLogout(LoggingOutEvent event, Emitter<LogoutState> emit) async {
    var logout = await sl<AuthLocalService>().logout();
    logout.fold((error) {}, (response) {
      emit(SuccessfullyLogout());
    });
  }
}
