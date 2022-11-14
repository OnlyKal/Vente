import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

Future<bool> verifySession() async {
  final prefs = await SharedPreferences.getInstance();
  final List<String>? session = prefs.getStringList('session');
  if (session == null) {
    return false;
  } else {
    return true;
  }
}
