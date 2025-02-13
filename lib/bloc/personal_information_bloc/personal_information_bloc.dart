import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/data/models/user_info.dart';
import 'package:handy_man/data/source/user_api_service.dart';
import 'package:handy_man/service_locator.dart';
import 'package:meta/meta.dart';

part 'personal_information_event.dart';
part 'personal_information_state.dart';

class PersonalInformationBloc
    extends Bloc<PersonalInformationEvent, PersonalInformationState> {
  PersonalInformationBloc() : super(PersonalInformationInitialState()) {
    on<PersonalInformationEvent>(_onGetUserById);
  }

  _onGetUserById(PersonalInformationEvent event,
      Emitter<PersonalInformationState> emit) async {
    emit(LoadingPersonalInformationState());
    var response = await sl<UserApiService>().getUser();
    response.fold((error) {
      emit(ErrorPersonalInformationState(errorMessage: error));
    }, (data) {
      emit(SuccessfullyPersonalInformationState(data: data));
    });
  }
}
