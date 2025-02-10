import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/data/source/service_api_service.dart';
import 'package:handy_man/service_locator.dart';
import 'package:meta/meta.dart';

part 'get_services_event.dart';
part 'get_services_state.dart';

class GetServicesBloc extends Bloc<GetServicesEvent, GetServicesState> {
  GetServicesBloc() : super(GetServicesInitial()) {
    on<GetServicesCategoryEvent>(_onGetServices);
  }

  _onGetServices(
      GetServicesCategoryEvent event, Emitter<GetServicesState> emit) async {
    emit(LoadingGetServicesState());
    var response = await sl<ServiceApiService>().getService();
    response.fold(
      (error) {
        emit(FailedGetServicesState(errorMessage: error.toString()));
      },
      (data) {
        emit(SuccessfullyGetServicesState(data: data));
      },
    );
  }
}
