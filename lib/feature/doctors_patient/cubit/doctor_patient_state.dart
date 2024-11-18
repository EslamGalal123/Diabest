part of 'doctor_patient_cubit.dart';

@immutable
sealed class DoctorPatientState {}

final class DoctorPatientInitial extends DoctorPatientState {}

final class GetAllDoctorSuccess extends DoctorPatientState {
  final List<DoctorsModel> doctors;

  GetAllDoctorSuccess({required this.doctors});
}

final class GetAllDoctorFailure extends DoctorPatientState {
  final String errorMessage;

  GetAllDoctorFailure({required this.errorMessage});
}
