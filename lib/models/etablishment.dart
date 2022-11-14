// ignore: unused_import
import 'package:at_stock/models/db.dart';

class Etablishment {
  final int? id;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? description;
  Etablishment({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.description
  });
  Map<String, dynamic> toMapWithId() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'email': email,
      'description': description
    };
  }
  Map<String, dynamic> toMapWithoutId() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'email': email,
      'description': description
    };
  }
  Future<dynamic> add() {
    Db db = Db();
    return db.add("etablishment", toMapWithoutId());
  }
   Future<dynamic> get() {
    Db db = Db();
    return db.get(" SELECT * FROM etablishment");
  }
}
