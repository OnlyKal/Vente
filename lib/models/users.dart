// ignore: unused_import
import 'package:at_stock/models/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Users {
  final int? id;
  final String? name;
  final String? username;
  final String? password;
  final String? phoneNumber;
  final String? role;
  const Users(
      {this.id,
      this.name,
      this.username,
      this.password,
      this.phoneNumber,
      this.role});

  Map<String, dynamic> toMapWithId() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'username': username,
      'password': password,
      'role': role,
    };
  }

  Map<String, dynamic> toMapWithoutId() {
    return {
      'phoneNumber': phoneNumber,
      'name': name,
      'username': username,
      'password': password,
      'role': role,
    };
  }

  Future<dynamic> add() {
    Db db = Db();
    return db.add("users", toMapWithoutId());
  }

  Future login(String username, String password) async {
    Db db = Db();
    var query = db.get("select * from users where username=$username") as Map;
    dynamic data;
    if (query is List && query.isNotEmpty) {
      if (data["password"] == password) {
        // Obtain shared preferences.
        final prefs = await SharedPreferences.getInstance();
        await prefs.setStringList('session',
            <String>[data["id"], data["username"], data["phoneNumber"]]);
        data = {"status": 200, "data": data};
      }
    } else {
      data = {"status": 400, "message": "incorrect username"};
    }
    return data;
  }

  Future destroySession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('session');
    return {"status": 200, "data": "disconnect"};
  }
}
