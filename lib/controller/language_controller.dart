import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/language.dart';

class LanguageProvider extends ChangeNotifier {
  List<Language> languageList = [];
  static const String _prefsKey = 'languageList';

  void submitLanguageDetails(Language language) {
    try{
      languageList.add(language);
      notifyListeners();
      print("added");
    }catch(e){
      print("fails");
    }
  }

  Future<void> saveLanguageList() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String encodedList = jsonEncode(languageList.map((e) => e.toJson()).toList());
      await prefs.setString(_prefsKey, encodedList);
      print("added shared preference");
    } catch(e) {
      print("fail to add in shared preference $e");
    }
  }

  Future<List<Language>> loadLanguageList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? encodedList = prefs.getString(_prefsKey);
    if (encodedList != null) {
      final List<dynamic> decodedList = jsonDecode(encodedList);
      List<Language> savedLanguageList =
      decodedList.map((e) => Language.fromJson(e)).toList();
      notifyListeners();
      return savedLanguageList;
    }

    return [];
  }
}
