part of 'get_categories_bloc.dart';

@immutable
abstract class GetCategoriesState {}

final class GetCategoriesInitial extends GetCategoriesState {}

class GetCategoriesLoading extends GetCategoriesState {}

class GetCategoriesSuccessfully extends GetCategoriesState {
  GetCategoriesSuccessfully({required this.data});

  final List<Map<String, dynamic>> data;
}

class GetCategoriesFailled extends GetCategoriesState {
  GetCategoriesFailled({required this.errorMessage});

  final String errorMessage;
}
