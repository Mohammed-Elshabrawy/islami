import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/home_screen/shared_perf_utils.dart';

class MostRecentProvider extends ChangeNotifier {
  //func and variables
  List<int> mostRecentList = [];
  void getLastSuraIndex() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentListIn =
        prefs.getStringList(SharedPerfKeys.mostRecentlyKey) ?? [];
    mostRecentList = mostRecentListIn
        .map((newSuraIndex) => int.parse(newSuraIndex))
        .toList()
        .reversed
        .toList();
    notifyListeners();
  }
  Future<void> resetMostRecent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPerfKeys.mostRecentlyKey);
    notifyListeners();
  }

}
