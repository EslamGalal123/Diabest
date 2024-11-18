import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderInitial());
  DateTime dateTime = DateTime.now();
  String date =
      '${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}';
  int? notificationYear;
  int? notificationMonth;
  int? notificationDay;


  void showCalenderPicker({required BuildContext context}) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2030))
        .then((value) {
      dateTime = value!;
      notificationYear = dateTime.year;
      notificationMonth = dateTime.month;
      notificationDay = dateTime.day;
      print("notificationYear -------> $notificationYear");
      print("notificationMonth -------> $notificationMonth");
      print("notificationDay -------> $notificationDay");

      date = '${dateTime.month}/${dateTime.day}/${dateTime.year}';
      emit(SuccessShowCalenderPicker(
          date: date,
          notificationYear: notificationYear,
          notificationMonth: notificationMonth,
          notificationDay: notificationDay));
    });
  }
}
