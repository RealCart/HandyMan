part of 'booking_constraints_bloc.dart';

@immutable
abstract class BookingConstraintsState {}

final class BookingConstraintsInitialState extends BookingConstraintsState {}

class LoadingBookingConstraintsState extends BookingConstraintsState {}

class SuccessfullyBookingConstraintsState extends BookingConstraintsState {
  SuccessfullyBookingConstraintsState({required this.data});

  final Map<String, dynamic> data;
}

class FailledBookingConstraintsState extends BookingConstraintsState {
  FailledBookingConstraintsState({required this.errorMessage});

  final String errorMessage;
}
