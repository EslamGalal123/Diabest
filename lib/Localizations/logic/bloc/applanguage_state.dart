part of 'applanguage_bloc.dart';

@immutable
sealed class ApplanguageState {}

final class ApplanguageInitial extends ApplanguageState {}

class AppChangeLanguage  extends ApplanguageState{

  final String? languageCode;
  AppChangeLanguage({this.languageCode});
}