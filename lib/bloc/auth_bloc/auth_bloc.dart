import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/data/models/signin_req_params.dart';
import 'package:handy_man/data/models/signup_req_params.dart';
import 'package:handy_man/data/source/auth_api_service.dart';
import 'package:meta/meta.dart';

import '../../service_locator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<SingUpEvent>(_onSignUpUser);
    on<LoginEvent>(_onLoginUser);
  }

  _onSignUpUser(SingUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    Either response = await sl<AuthApiService>().signUp(event.userInfo);
    response.fold(
      (error) {
        emit(AuthError(errorMessage: error));
      },
      (response) {
        emit(AuthSuccessfully());
      },
    );
  }

  _onLoginUser(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    Either response = await sl<AuthApiService>().signIn(event.userInfo);
    response.fold(
      (error) {
        emit(AuthError(errorMessage: error));
      },
      (response) {
        emit(AuthSuccessfully());
      },
    );
  }
}
