import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/skill.dart';

class SkillProvider extends ChangeNotifier {
  List<Skill> skillList = [];
  static const String _prefsKey = 'skillList';

  void submitSkillDetails(Skill skill) {
    try{
      skillList.add(skill);
      notifyListeners();
      print("added");
    }catch(e){
      print("fails");
    }
  }

  Future<void> saveSkillList() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String encodedList = jsonEncode(skillList.map((e) => e.toJson()).toList());
      await prefs.setString(_prefsKey, encodedList);
      print("added shared preference");
    } catch(e) {
      print("fail to add in shared preference $e");
    }
  }

  Future<List<Skill>> loadSkillList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? encodedList = prefs.getString(_prefsKey);
    if (encodedList != null) {
      final List<dynamic> decodedList = jsonDecode(encodedList);
      List<Skill> savedSkillList =
      decodedList.map((e) => Skill.fromJson(e)).toList();
      notifyListeners();
      return savedSkillList;
    }

    return [];
  }
}
