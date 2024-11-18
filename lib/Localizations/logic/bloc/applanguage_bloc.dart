import 'package:bloc/bloc.dart';
import 'package:diiabest/core/Database/cache/constants.dart';
import 'package:meta/meta.dart';
part 'applanguage_event.dart';
part 'applanguage_state.dart';

class ApplanguageBloc extends Bloc<ApplanguageEvent, ApplanguageState> {
  ApplanguageBloc() : super(ApplanguageInitial()) {
    on<ApplanguageEvent>((event, emit) {
if(event is InitialLanguage){
if(sharedPreferences!.getString('lang') !=null){
  if(sharedPreferences!.getString('lang')=='ar'){
    emit(AppChangeLanguage(languageCode: 'ar'));

  }
  else{
    emit(AppChangeLanguage(languageCode: 'en'));

  }
}

}    
else if(event is ArabicLanguageEvent){
            sharedPreferences!.setString('lang', 'ar');
emit(AppChangeLanguage(languageCode: 'ar'));

}
else if(event is EnglishLanguageEvent){

            sharedPreferences!.setString('lang', 'en');
emit(AppChangeLanguage(languageCode: 'en'));

}

});
  }
}
