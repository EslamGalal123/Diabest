
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/services/http_helper.dart';
import 'package:diiabest/feature/auth/auth_cubit/autch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool? termsAndConditionCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;
  TextEditingController fullName = TextEditingController();

  TextEditingController nationalID = TextEditingController();

  TextEditingController emailAddress = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmThePassword = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey();
  GlobalKey<FormState> signinFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  final http = HttpHelper();
  String gender = AppStrings.male;
  String role = AppStrings.patient;
  late UserModel currentUser;

  Future<void> saveUserData({
    required String value,
    required String key,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<void> checkShowOnBoard() async {
    String? onBoard = await getUserLocalStorage(key: 'onBording');
    if (onBoard != null) {
      emit(ShowOnBoard());
    } else {
      emit(UnShowOnBoard());
    }
  }

  Future<void> checkIsLogin() async {
    try {
      String? token = await getUserLocalStorage(key: 'token');
      String? role = await getUserLocalStorage(key: 'role');
      if (token == null) {
        emit(UserNotFound());
      } else {
        await getUserData();
        emit(UserFound(role: role!));
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> getUserData() async {
    try {
      String? id = await getUserLocalStorage(key: 'id');
      String url = 'Register/getUser/$id';
      var value = await http.get(url);
      if (value['data'] != null) {
        currentUser = UserModel.fromJson(value['data']);
      }
    } on Exception catch (_) {}
  }

  Future<String?> getUserLocalStorage({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  Future<void> signUpWithEmailAndPassword() async {
    try {
      String url = 'Register/signup';
      await http.post(url, {
        "fullName": fullName.text,
        "nationalId": nationalID.text,
        "gender": gender,
        "email": emailAddress.text,
        "password": password.text,
        "confirmPassword": confirmThePassword.text,
        "role": role,
      }).then((value) async {
        if (value['token'] != null) {
          await saveUserData(
            value: value['token'],
            key: 'token',
          );
          currentUser = UserModel.fromJson(value['user']);
          await saveUserData(
            value: currentUser.sId,
            key: 'id',
          );
          await saveUserData(
            value: currentUser.role,
            key: 'role',
          );
          emit(SignUpSuccess(
            currentUser: currentUser,
          ));
        } else {
          emit(
            SignUpFailure(
              errMessage: value['message'] ?? value.toString(),
            ),
          );
        }
      });
    } on Exception catch (e) {
      emit(SignUpFailure(errMessage: e.toString()));
    }
  }

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(SigninLoadingState());
      String url = 'Register/login';
      await http.post(url, {
        "email": email,
        "password": password,
      }).then(
        (value) async {
          if (value['token'] != null) {
            await saveUserData(
              value: value['token'],
              key: 'token',
            );
            currentUser = UserModel.fromJson(value['user']);
            await saveUserData(
              value: currentUser.sId,
              key: 'id',
            );
            await saveUserData(
              value: currentUser.role,
              key: 'role',
            );
            emit(
              SigninSuccessState(
                currentUser: currentUser,
              ),
            );
          } else {
            emit(
                SigninFailureState(errorMessage: 'erorr in email or password'));
          }
        },
      );
    } catch (e) {
      emit(SigninFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> forgetPassword({
    required String email,
  }) async {
    try {
      String url = "Register/forgetPassword";
      var value = await http.post(url, {'email': email});
      if (value['success'] != null) {
        await saveUserData(key: 'token', value: value['resetToken']);
        emit(SendCodeSuccess());
      } else {
        emit(SendCodeFailure(
            errorMessage: value['message'] ?? value.toString()));
      }
    } on Exception catch (e) {
      emit(SendCodeFailure(errorMessage: e.toString()));
    }
  }

  Future<void> verifyEmailCode({required String code}) async {
    try {
      String url = "Register/verifyResetPasswordCode";
      String? token = await getUserLocalStorage(key: 'token');
      await http.post(url, {'resetCode': code}, token: token).then((value) {
        if (value['success'] != null) {
          emit(VerifyEmailSuccess());
        } else {
          VerifyEmailFailure(
            errorMessage: value['message'] ?? value.toString(),
          );
        }
      });
    } catch (e) {
      emit(VerifyEmailFailure(errorMessage: e.toString()));
    }
  }

  Future<void> resetPassword(
      {required String password, required String comfirmPassword}) async {
    try {
      String url = "Register/resetPassword";
      String? token = await getUserLocalStorage(key: 'token');
      await http
          .put(
              url,
              {
                "newPassword": password,
                "confirmNewPassword": comfirmPassword,
              },
              token: token!)
          .then((value) {
        if (value['success']) {
          emit(ResetPasswordSuccess());
        } else {
          ResetPasswordFailure(
            errorMessage: value['message'] ?? value.toString(),
          );
        }
      });
    } catch (e) {
      emit(ResetPasswordFailure(errorMessage: e.toString()));
    }
  }


  void updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }
}
