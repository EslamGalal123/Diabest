
import 'package:diiabest/models/user_model.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

final class ShowOnBoard extends AuthState {}
final class UnShowOnBoard extends AuthState {}
final class UserFound extends AuthState {
  final String role;

  UserFound({required this.role});
}

final class UserNotFound extends AuthState {}

final class SignupLoadingState extends AuthState {}

final class SignUpSuccess extends AuthState {
  final UserModel currentUser;

  SignUpSuccess({required this.currentUser});
}

final class SignUpFailure extends AuthState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class SigninLoadingState extends AuthState {}

final class SigninSuccessState extends AuthState {
  final UserModel currentUser;

  SigninSuccessState({required this.currentUser});
}

final class SigninFailureState extends AuthState {
  final String errorMessage;

  SigninFailureState({required this.errorMessage});
}

final class SendCodeSuccess extends AuthState {}

final class SendCodeFailure extends AuthState {
  final String errorMessage;

  SendCodeFailure({required this.errorMessage});
}

final class VerifyEmailSuccess extends AuthState {}

final class VerifyEmailFailure extends AuthState {
  final String errorMessage;

  VerifyEmailFailure({required this.errorMessage});
}

final class ResetPasswordSuccess extends AuthState {}

final class ResetPasswordFailure extends AuthState {
  final String errorMessage;

  ResetPasswordFailure({required this.errorMessage});
}

final class TermsAndConditionUpdateState extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}
