import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/data/source/booking_contraints_api_service.dart';
import 'package:handy_man/service_locator.dart';
import 'package:meta/meta.dart';

part 'booking_constraints_event.dart';
part 'booking_constraints_state.dart';

class BookingConstraintsBloc
    extends Bloc<BookingConstraintsEvent, BookingConstraintsState> {
  BookingConstraintsBloc() : super(BookingConstraintsInitialState()) {
    on<GetBookingConstraintsEvent>(_onGetBookingConstraintsEvent);
  }

  _onGetBookingConstraintsEvent(GetBookingConstraintsEvent event,
      Emitter<BookingConstraintsState> emit) async {
    emit(LoadingBookingConstraintsState());
    var response =
        await sl<BookingContraintsApiService>().getBookingContraints();
    response.fold((error) {
      emit(FailledBookingConstraintsState(errorMessage: error));
    }, (data) {
      emit(SuccessfullyBookingConstraintsState(data: data));
    });
  }
}
