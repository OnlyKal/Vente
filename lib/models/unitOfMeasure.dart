// ignore: unused_import
import 'package:at_stock/models/db.dart';

class UniteOfMeasure {
  final int? id;
  final String? name;
  final String? symbole;
  const UniteOfMeasure({this.id, this.name, this.symbole});
  Map<String, dynamic> toMapWithId() {
    return {'id': id, 'name': name, 'symbole': symbole};
  }

  Map<String, dynamic> toMapWithoutId() {
    return {'id': id, 'name': name, 'symbole': symbole};
  }

  Future<dynamic> add() {
    Db db = Db();
    return db.add("uniteOfMeasure", toMapWithoutId());
  }

  Future<dynamic> getAll() {
    Db db = Db();
    return db.get(" SELECT * FROM uniteOfMeasure");
  }

  Future<dynamic> get(int id) {
    Db db = Db();
    return db.get(" SELECT * FROM uniteOfMeasure where id=$id ");
  }
}
