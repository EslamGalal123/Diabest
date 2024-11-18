import 'package:bloc/bloc.dart';
import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/services/http_helper.dart';
import 'package:diiabest/models/doctor_model.dart';
import 'package:flutter/material.dart';

part 'doctor_patient_state.dart';

class DoctorPatientCubit extends Cubit<DoctorPatientState> {
  DoctorPatientCubit() : super(DoctorPatientInitial());
  HttpHelper http = HttpHelper();
  List<DoctorsModel> allDoctors = [];
  final searchController = TextEditingController();
  Future<void> getAllDoctor() async {
    String url = 'Doctor/getAllDoctors';
    var data = await http.get(url);
    if (data['data'] != null) {
      List<DoctorsModel> doctors = [];
      for (int i = 0; i < data['data'].length; i++) {
        doctors.add(
          DoctorsModel.fromJson(
            data['data'][i],
            specialization: await getDoctorSpecialization(
              id: data['data'][i]['specialization'],
            ),
          ),
        );
      }
      allDoctors = doctors;
      emit(GetAllDoctorSuccess(doctors: allDoctors));
    } else {
      emit(GetAllDoctorFailure(errorMessage: data.toString()));
    }
  }

  Future<String> getDoctorSpecialization({required String id}) async {
    try {
      String url = 'specialization';
      var data = await http.get(url);
      for (int i = 0; i < data['data'].length; i++) {
        if (data['data'][i]['_id'] == id) {
          var specialization = data['data'][i]['specialization'];
          return specialization;
        }
      }
      return 'null';
    } on Exception catch (e) {
      emit(GetAllDoctorFailure(errorMessage: e.toString()));
      return 'error';
    }
  }

  Future<void> searchDoctor() async {
    List<DoctorsModel> doctors = [];
    for (int i = 0; i < allDoctors.length; i++) {
      if (allDoctors[i].fullName.contains(searchController.text)) {
        doctors.add(allDoctors[i]);
      }
    }
    emit(GetAllDoctorSuccess(doctors: doctors));
  }

  String getDoctorImage({required String specialization}) {
    {
      if (specialization == 'Internist') {
        return Assets.imagesImageInternist;
      } else if (specialization == 'Cardiologist') {
        return Assets.imagesImageCardiologist;
      } else if (specialization == 'Dermatology') {
        return Assets.imagesImageDermatolo;
      } else {
        return Assets.imagesHepatologist;
      }
    }
  }
}
