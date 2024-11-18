part of 'calender_cubit.dart';

@immutable
abstract class CalenderState {}

class CalenderInitial extends CalenderState {}
class SuccessShowCalenderPicker extends CalenderState {
  String? date;
  int? notificationYear;
  int? notificationMonth;
  int? notificationDay;
  SuccessShowCalenderPicker({required this.date,required this.notificationYear, required this.notificationMonth, required this.notificationDay});
}
