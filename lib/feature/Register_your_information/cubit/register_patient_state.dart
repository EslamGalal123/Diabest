part of 'register_patient_cubit.dart';

@immutable
sealed class RegisterPatientState {}

final class RegisterPatientInitial extends RegisterPatientState {}

final class RegisterPatientLoading extends RegisterPatientState {}

final class RegisterPatientSuccess extends RegisterPatientState {}

final class RegisterPatientFailure extends RegisterPatientState {
  final String errorMessage;

  RegisterPatientFailure({required this.errorMessage});
}
