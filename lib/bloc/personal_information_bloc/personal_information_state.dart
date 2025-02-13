part of 'personal_information_bloc.dart';

@immutable
abstract class PersonalInformationState {}

final class PersonalInformationInitialState extends PersonalInformationState {}

class LoadingPersonalInformationState extends PersonalInformationState {}

class SuccessfullyPersonalInformationState extends PersonalInformationState {
  SuccessfullyPersonalInformationState({required this.data});

  final Userinfo data;
}

class ErrorPersonalInformationState extends PersonalInformationState {
  ErrorPersonalInformationState({required this.errorMessage});

  final String errorMessage;
}
