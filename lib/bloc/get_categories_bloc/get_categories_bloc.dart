import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/data/source/categories_api_service.dart';
import 'package:meta/meta.dart';

import '../../service_locator.dart';

part 'get_categories_event.dart';
part 'get_categories_state.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  GetCategoriesBloc() : super(GetCategoriesInitial()) {
    on<GetCategoriesEvent>(_onGetCategories);
  }

  _onGetCategories(
      GetCategoriesEvent event, Emitter<GetCategoriesState> emit) async {
    emit(GetCategoriesLoading());
    Either response = await sl<CategoriesApiService>().getCategories();
    response.fold((error) {
      emit(GetCategoriesFailled(errorMessage: error));
    }, (response) {
      emit(GetCategoriesSuccessfully(data: response));
    });
  }
}
