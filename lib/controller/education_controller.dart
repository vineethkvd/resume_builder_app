import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/education.dart';

class EducationProvider extends ChangeNotifier {
  List<EducationModel> eduList = [];
  static const String _prefsKey = 'educationList';

  void submitEducationDetails(EducationModel education) {
   try{
     eduList.add(education);
     notifyListeners();
     print("added");
   }catch(e){
     print("fails");
   }
  }

  Future<void> saveEducationList() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String encodedList = jsonEncode(eduList.map((e) => e.toJson()).toList());
      await prefs.setString(_prefsKey, encodedList);
      print("added shared preference");
    } catch(e) {
      print("fail to add in shared prefrence $e");
    }
  }


  Future<List<EducationModel>> loadEducationList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? encodedList = prefs.getString(_prefsKey);
    if (encodedList != null) {
      final List<dynamic> decodedList = jsonDecode(encodedList);
      List<EducationModel> savedEduList =
          decodedList.map((e) => EducationModel.fromJson(e)).toList();
      notifyListeners();
      return savedEduList;
    }

    return [];
  }
}
