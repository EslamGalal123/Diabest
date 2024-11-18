part of 'time_cubit.dart';

@immutable
abstract class TimeState {}

class TimeInitial extends TimeState {}
class SuccessShowTimerPicker extends TimeState {
  String? time;
  int? notificationHour;
  int? notificationMinute;
  List reminderAddedList = [] ;
  SuccessShowTimerPicker({required this.time,required this.notificationHour, required this.notificationMinute ,required this.reminderAddedList});
}
