import 'package:fl_audio_book/localization/localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslate(BuildContext context, String key) {
  return DemoLocalizations.of(context).getTransalatedValue(key);
}

String translate(String key) {
  return DemoLocalizations.instance.getTransalatedValue(key);
}

const String english = 'en';

const String hindi = 'hi';

const String indonesian = 'id';

const String chainese = 'zh';

const String arabic = 'ar';

const languageKey = 'languageCode';

Future setLocale(String languageCode) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(languageKey, languageCode);
  return _locale(languageCode);
}

Future getLocale() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String languageCode = preferences.getString(languageKey) ?? english;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale temp;
  switch (languageCode) {
    case english:
      temp = Locale(languageCode);
      break;
    case hindi:
      temp = Locale(languageCode);
      break;
    case indonesian:
      temp = Locale(languageCode);
      break;
    case chainese:
      temp = Locale(languageCode);
      break;
    case arabic:
      temp = Locale(languageCode);
      break;
    default:
      temp = const Locale(english);
  }
  return temp;
}
