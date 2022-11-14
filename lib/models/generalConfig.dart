// ignore: unused_import
import 'package:at_stock/models/db.dart';
class GeneralConfig{
  final int? id;
  final String? name;
  final String? value;
  const GeneralConfig({
    this.id,this.name,this.value
  });
  Map<String, dynamic> toMapWithId() {
    return {
      'id': id,
      'name': name,
      'value': value
    };
  }
  Map<String, dynamic> toMapWithoutId() {
    return {
      'id': id,
      'name': name,
      'value': value
    };
  }
  Future<dynamic> add() {
    Db db = Db();
    return db.add("generalConfig", toMapWithoutId());
  }
  Future<dynamic> getAll() {
    Db db = Db();
    return db.get(" SELECT * FROM generalConfig");
  }
  Future<dynamic> get(int id) {
    Db db = Db();
    return db.get(" SELECT * FROM generalConfig where id=$id ");
  }
}