part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SingUpEvent extends AuthEvent {
  SingUpEvent({required this.userInfo});
  final SignupReqParams userInfo;
}

class LoginEvent extends AuthEvent {
  LoginEvent({required this.userInfo});
  final SigninReqParams userInfo;
}
