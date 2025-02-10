part of 'get_services_bloc.dart';

@immutable
abstract class GetServicesState {}

final class GetServicesInitial extends GetServicesState {}

class LoadingGetServicesState extends GetServicesState {}

class SuccessfullyGetServicesState extends GetServicesState {
  SuccessfullyGetServicesState({required this.data});

  final List<Map<String, dynamic>> data;
}

class FailedGetServicesState extends GetServicesState {
  FailedGetServicesState({required this.errorMessage});

  final String errorMessage;
}
