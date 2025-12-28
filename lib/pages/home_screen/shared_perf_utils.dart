import 'package:shared_preferences/shared_preferences.dart';

class SharedPerfKeys {
  static const String mostRecentlyKey = 'most-recently';
}

//Todo:write
Future<void> saveLastSuraIndex(int suraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentList =
      prefs.getStringList(SharedPerfKeys.mostRecentlyKey) ?? [];
  if (mostRecentList.contains(suraIndex.toString())) {
    mostRecentList.remove(suraIndex.toString());
    mostRecentList.add(suraIndex.toString());
  } else {
    mostRecentList.add(suraIndex.toString());
  }
  if (mostRecentList.length > 5) {
    mostRecentList.removeAt(0);
  }

  await prefs.setStringList(SharedPerfKeys.mostRecentlyKey, mostRecentList);
}

//Todo:read


