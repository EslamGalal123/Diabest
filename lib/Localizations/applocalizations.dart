import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Applocalizations{
     Locale ? locale;

  Applocalizations({
    required this.locale
  });

static Applocalizations? of(BuildContext context){
  return Localizations.of<Applocalizations>(context, Applocalizations);  
}
static LocalizationsDelegate<Applocalizations> delegate =_ApplocalizationsDelegate();

late Map <String,String> jsonStrings;
Future loadlangJason()async{
String strings= await rootBundle.loadString("Assets/Language/${locale!.languageCode}.json");
Map<String,dynamic> jsons =json.decode(strings);
jsonStrings = jsons.map((key, value) {
return MapEntry(key, value.toString());
});
}
String translatetext(String key)=>jsonStrings[key]?? "";

}

class _ApplocalizationsDelegate extends LocalizationsDelegate<Applocalizations>{
  @override
  bool isSupported(Locale locale) {
    return ['en','ar'].contains(locale.languageCode);
  }

  @override
  Future<Applocalizations> load(Locale locale) async{
    Applocalizations applocalizations =Applocalizations(locale: locale);
    await applocalizations.loadlangJason();
    return applocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Applocalizations> old) =>false;
   
  
  
}