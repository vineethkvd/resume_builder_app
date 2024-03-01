import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/person.dart';

class PersonProvider extends ChangeNotifier {
  List<Person> personList = [];
  static const String _prefsKey = 'personList';

  void submitPersonDetails(Person person) {
    try {
      personList.add(person);
      notifyListeners();
      print("added");
    } catch (e) {
      print("fails");
    }
  }

  Future<void> savePersonList() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String encodedList =
          jsonEncode(personList.map((e) => e.toJson()).toList());
      await prefs.setString(_prefsKey, encodedList);
      print("added shared preference");
    } catch (e) {
      print("fail to add in shared preference $e");
    }
  }

  Future<List<Person>> loadPersonList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? encodedList = prefs.getString(_prefsKey);
    if (encodedList != null) {
      final List<dynamic> decodedList = jsonDecode(encodedList);
      List<Person> savedPersonList =
          decodedList.map((e) => Person.fromJson(e)).toList();
      notifyListeners();
      return savedPersonList;
    }
    notifyListeners();
    return [];
  }
}
