part of 'logged_in_bloc.dart';

@immutable
abstract class LoggedInState {}

final class LoggedInInitialState extends LoggedInState {}

class Authenticated extends LoggedInState {}

class UnAuthenticated extends LoggedInState {}
