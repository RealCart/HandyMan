part of 'favorities_bloc.dart';

@immutable
abstract class FavoritiesState {}

final class FavoritiesInitialState extends FavoritiesState {}

class LoadingUserFavoritiesState extends FavoritiesState {}

class SuccessfullyUserFavoritiesState extends FavoritiesState {
  SuccessfullyUserFavoritiesState({required this.data});

  final List<Map<String, dynamic>> data;
}

class FailledFavoritiesState extends FavoritiesState {
  FailledFavoritiesState({required this.errorMessage});

  final String errorMessage;
}
