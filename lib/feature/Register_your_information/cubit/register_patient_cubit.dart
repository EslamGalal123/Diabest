import 'package:bloc/bloc.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/services/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'register_patient_state.dart';

class RegisterPatientCubit extends Cubit<RegisterPatientState> {
  RegisterPatientCubit() : super(RegisterPatientInitial());
  final height = TextEditingController();
  final weight = TextEditingController();
  late String? diabeticcama;
  late String? doyousmoke;
  late String? familyhavediabetes;
  late String? oral;
  late String? presuremedications;
  late String? takemedications;
  late String? drinkachol;
  late String? pancreasdisease;
  String? oralContraceptives;
  String? breastfeeding;
  String? pregnant;
  HttpHelper http = HttpHelper();
  late String age;
  late String status;
  final formKey = GlobalKey<FormState>();
  Future<void> registerPatient({
    required String gender,
  }) async {
    emit(RegisterPatientLoading());
    try {
      String token = await getUserFromLocalStorage(key: 'token');
      String url = 'Patient/patientRegisteration';
      var maleData = {
        "age": age,
        "weight": weight.text,
        "height": height.text,
        "status": status,
        "gender": gender,
        "diabeticComa": diabeticcama ?? "false",
        "somking": doyousmoke ?? "false",
        "geneticDiabetes": familyhavediabetes ?? "false",
        "bloodPresure": presuremedications ?? "false",
        "heartDisease": presuremedications ?? "false",
        "alcohols": drinkachol ?? "false",
        "pancreasDisease": pancreasdisease ?? "false",
        "oralContraceptives": "false",
        "pregnant": "false",
        "breastfeeding": "false"
      };
      var feMaleData = {
        "age": age,
        "weight": weight.text,
        "height": height.text,
        "status": status,
        "gender": gender,
        "diabeticComa": diabeticcama ?? "false",
        "somking": doyousmoke ?? "false",
        "geneticDiabetes": familyhavediabetes ?? "false",
        "bloodPresure": presuremedications ?? "false",
        "heartDisease": presuremedications ?? "false",
        "alcohols": drinkachol ?? "false",
        "oralContraceptives": oralContraceptives ?? "false",
        "pancreasDisease": pancreasdisease ?? "false",
        "breastfeeding": breastfeeding ?? "false",
        "pregnant": pregnant ?? "false",
      };
      await http
          .post(url, gender == AppStrings.male ? maleData : feMaleData,
              token: token)
          .then((value) {
        if (value['token'] != null) {
          emit(RegisterPatientSuccess());
        } else {
          emit(RegisterPatientFailure(
            errorMessage: value['message'] ?? value.toString(),
          ));
        }
      });
    } catch (e) {
      emit(RegisterPatientFailure(errorMessage: e.toString()));
    }
  }

  Future<String> getUserFromLocalStorage({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key)!;
  }
}
