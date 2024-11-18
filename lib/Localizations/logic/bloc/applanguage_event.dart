part of 'applanguage_bloc.dart';

@immutable
abstract class ApplanguageEvent {}

  class InitialLanguage extends ApplanguageEvent{}
    class ArabicLanguageEvent extends ApplanguageEvent{}

  class EnglishLanguageEvent extends ApplanguageEvent{}


