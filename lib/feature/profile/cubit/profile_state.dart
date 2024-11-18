part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileSuccess extends ProfileState {
  final PatientModel user;

  GetProfileSuccess({required this.user});
}

final class GetProfileFailure extends ProfileState {}

final class UpdateProfileSuccess extends ProfileState {}

final class UpdateProfileFailure extends ProfileState {
  final String errMessage;

  UpdateProfileFailure({required this.errMessage});
}

final class RestPasswordLoading extends ProfileState {}

final class RestPasswordSuccess extends ProfileState {}

final class VerifyEmailSuccess extends ProfileState {}

final class RestPasswordFailure extends ProfileState {
  final String errMessage;

  RestPasswordFailure({required this.errMessage});
}

final class UploadImageSuccess extends ProfileState {}

final class SignOut extends ProfileState {}

final class UploadImageFailure extends ProfileState {
  final String errMessage;

  UploadImageFailure({required this.errMessage});
}