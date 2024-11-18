import 'package:bloc/bloc.dart';
import 'package:diiabest/core/services/http_helper.dart';
import 'package:diiabest/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  final formKey = GlobalKey<FormState>();
  TextEditingController citystreetblocknumber = TextEditingController();
  TextEditingController phoneNumbe = TextEditingController();
  TextEditingController whatsApp = TextEditingController();
  TextEditingController facebook = TextEditingController();
  HttpHelper http = HttpHelper();
  late String startTime;
  late String endTime;
  late String specialization;
  void seletSpecialization({required int index}) {
    if (index == 0) {
      specialization = '65cbba3231fa6501be3bdee9';
    } else if (index == 1) {
      specialization = '65cbba6a31fa6501be3bdeec';
    } else if (index == 2) {
      specialization = '65cbba8131fa6501be3bdeef';
    } else if (index == 3) {
      specialization = '65cbbaa131fa6501be3bdef2';
    }
  }

  Future<void> getDoctorData() async {
    try {
      String id = await getUserLocalStorage(key: 'id');
      String url = 'Register/getUser/$id';
      await http.get(url).then((value) async {
        if (value['data']['doctor'] != null) {
          var id = value['data']['doctor']['specialization'];
          String specialization = await getDoctorSpecialization(id: id);
          var doctor = DoctorsModel.fromJson(value['data']['doctor'],
              fullName: value['data']['fullName'],
              specialization: specialization);
          emit(
            GetProfileSuccess(doctor: doctor),
          );
        } else {
          emit(GetProfileFailure(
              errorMessage: value['message'] ?? value.toString()));
        }
      });
    } on Exception catch (e) {
      emit(GetProfileFailure(errorMessage: e.toString()));
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
      emit(GetProfileFailure(errorMessage: e.toString()));
      return 'error';
    }
  }

  Future<String> getUserLocalStorage({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key)!;
  }

  Future<void> registerDoctor() async {
    try {
      String token = await getUserLocalStorage(key: 'token');
      String url = 'Doctor/doctorRegisteration';
      await http
          .post(
        url,
        {
          "specialization": specialization,
          "phoneNumber": phoneNumbe.text,
          "clinicAddress": citystreetblocknumber.text,
          "startTime": startTime,
          "endTime": endTime,
          "facebookLink": facebook.text,
          "whatsappLink": whatsApp.text
        },
        token: token,
      )
          .then((value) {
        print(value);
        if (value['updatedUser']['doctor'] != null) {
          emit(RegisterDoctorSuccess());
        } else {
          emit(RegisterDoctorFailure(
            errorMessage: value['message'] ?? value.toString(),
          ));
        }
      });
    } catch (e) {
      emit(RegisterDoctorFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateDoctor(
      {required String phoneNumber,
      required String clinicAddress,
      required String facebook,
      required String whatsApp}) async {
    if (formKey.currentState!.validate()) {
      try {
        String token = await getUserLocalStorage(key: 'token');
        String id = await getUserLocalStorage(key: 'id');
        String url = 'Doctor/editProfile/$id';
        await http
            .put(
          url,
          {
            "phoneNumber": phoneNumber,
            "clinicAddress": clinicAddress,
            "startTime": startTime,
            "endTime": endTime,
            "facebookLink": facebook,
            "whatsappLink": whatsApp
          },
          token: token,
        )
            .then((value) {
          if (value['user']['doctor'] != null) {
            emit(UpdateDoctorSuccess());
          } else {
            emit(UpdateDoctorFailure(
              errorMessage: value['message'] ?? value.toString(),
            ));
          }
        });
      } catch (e) {
        emit(UpdateDoctorFailure(errorMessage: e.toString()));
      }
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
}
