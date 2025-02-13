import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/data/models/favorites.dart';
import 'package:handy_man/data/source/favorities_api_service.dart';
import 'package:handy_man/service_locator.dart';
import 'package:meta/meta.dart';

part 'favorities_event.dart';
part 'favorities_state.dart';

class FavoritiesBloc extends Bloc<FavoritiesEvent, FavoritiesState> {
  FavoritiesBloc() : super(FavoritiesInitialState()) {
    on<GetFavorite>(_onGetUserFavorities);
  }

  _onGetUserFavorities(GetFavorite event, Emitter<FavoritiesState> emit) async {
    emit(LoadingUserFavoritiesState());
    Either response = await sl<FavoritiesApiService>().getFavorities();
    response.fold((error) {
      emit(FailledFavoritiesState(errorMessage: error));
    }, (data) {
      emit(SuccessfullyUserFavoritiesState(data: data));
    });
  }
}
