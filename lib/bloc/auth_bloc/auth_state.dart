part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

final class AuthInitialState extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccessfully extends AuthState {}

class AuthError extends AuthState {
  AuthError({required this.errorMessage});

  final String errorMessage;
}
