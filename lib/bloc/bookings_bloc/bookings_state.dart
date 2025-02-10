part of 'bookings_bloc.dart';

@immutable
abstract class BookingsState {}

final class BookingsInitialState extends BookingsState {}

class LoadingUserBookingsState extends BookingsState {}

class SuccessfullyLoadedBookingsState extends BookingsState {
  SuccessfullyLoadedBookingsState({required this.data});

  final dynamic data;
}

class ErrorLoadedBookingsState extends BookingsState {
  ErrorLoadedBookingsState({required this.errorMessage});

  final String errorMessage;
}
