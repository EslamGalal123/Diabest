part of 'doctor_cubit.dart';

@immutable
sealed class DoctorState {}

final class DoctorInitial extends DoctorState {}

final class GetProfileSuccess extends DoctorState {
  final DoctorsModel doctor;

  GetProfileSuccess({required this.doctor});
}

final class GetProfileFailure extends DoctorState {
  final String errorMessage;

  GetProfileFailure({required this.errorMessage});
}

final class RegisterDoctorSuccess extends DoctorState {}

final class RegisterDoctorFailure extends DoctorState {
  final String errorMessage;

  RegisterDoctorFailure({required this.errorMessage});
}

final class SignOut extends DoctorState {}

final class UpdateDoctorSuccess extends DoctorState {}

final class UpdateDoctorFailure extends DoctorState {
  final String errorMessage;

  UpdateDoctorFailure({required this.errorMessage});

}
