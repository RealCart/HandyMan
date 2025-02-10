part of 'logout_bloc.dart';

@immutable
abstract class LogoutState {}

final class LogoutInitialState extends LogoutState {}

class SuccessfullyLogout extends LogoutState {}
