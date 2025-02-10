import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/data/source/booking_api_service.dart';
import 'package:handy_man/service_locator.dart';
import 'package:meta/meta.dart';

part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  BookingsBloc() : super(BookingsInitialState()) {
    on<LoadUserBookingsEvent>(_onGetBookings);
  }
}

_onGetBookings(LoadUserBookingsEvent event, Emitter<BookingsState> emit) async {
  emit(LoadingUserBookingsState());
  var response = await sl<BookingApiService>().getBookings();
  response.fold((error) {
    emit(ErrorLoadedBookingsState(errorMessage: error));
  }, (response) {
    emit(SuccessfullyLoadedBookingsState(data: response));
  });
}
