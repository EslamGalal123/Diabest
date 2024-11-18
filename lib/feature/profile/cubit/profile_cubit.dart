import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:diiabest/core/services/http_helper.dart';
import 'package:diiabest/models/patiant_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  HttpHelper http = HttpHelper();
  final fullName = TextEditingController();
  final weight = TextEditingController();
  final height = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late String status;
  late File userImage;
  Future<void> getPatientData() async {
    try {
      String id = await getUserFromLocalStorage(key: 'id');
      String url = 'Register/getUser/$id';
      http.get(url).then((value) {
        if (value['data'] != null) {
          if (value['data']['patient'] != null) {
            var patient = PatientModel.fromJson(value['data']['patient']);
            emit(
              GetProfileSuccess(user: patient),
            );
          }
        }
      });
    } on Exception catch (_) {
      emit(GetProfileFailure());
    }
  }

  Future<void> signOut() async {
    await killToken();
    emit(SignOut());
  }

  Future<void> killToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('token');
    await preferences.remove('id');
  }

  Future<void> changePassword(
      {required String password,
      required String newPassword,
      required String confirmNewPassword}) async {
    try {
      String token = await getUserFromLocalStorage(key: 'token');
      String id = await getUserFromLocalStorage(key: 'id');
      String url = "Register/editProfile/$id/changePassword";
      await http
          .put(
              url,
              {
                "currentPassword": password,
                'password': newPassword,
                'confirmPassword': confirmNewPassword,
              },
              token: token)
          .then(
        (value) {
          if (value['token'] != null) {
            emit(RestPasswordSuccess());
          } else {
            emit(RestPasswordFailure(
                errMessage: value['message'] ?? value.toString()));
          }
        },
      );
    } on Exception catch (e) {
      emit(RestPasswordFailure(errMessage: e.toString()));
    }
  }

  Future<String> getUserFromLocalStorage({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key)!;
  }

  Future<void> updateProfile() async {
    if (formKey.currentState!.validate()) {
      try {
        String token = await getUserFromLocalStorage(key: 'token');
        String id = await getUserFromLocalStorage(key: 'id');
        String url = 'Patient/editProfile/$id';
        await http
            .put(
                url,
                {
                  "fullName": fullName.text,
                  "weight": weight.text,
                  "height": height.text,
                  "status": status
                },
                token: token)
            .then(
          (value) async {
            if (value['user'] != null) {
              emit(UpdateProfileSuccess());
            } else {
              emit(UpdateProfileFailure(errMessage: value['message']));
            }
          },
        );
      } catch (e) {
        emit(UpdateProfileFailure(errMessage: e.toString()));
      }
    }
  }

  Future<void> uploadImage() async {
    try {
      String url = 'Register/uploadUserImage';
      String token = await getUserFromLocalStorage(key: 'token');
      List<int> imageBytes = await userImage.readAsBytes();
      await http
          .putfile(url, {"profileImage": imageBytes}, token: token)
          .then((value) {
      });
    } catch (e) {
      emit(UploadImageFailure(errMessage: e.toString()));
    }
  }
}
