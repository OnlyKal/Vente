// ignore: unused_import
import 'dart:ffi';

import 'package:at_stock/models/db.dart';
class Exercise{
    final int? id;
  final DateTime ? startDate;
  final DateTime? endDate;
  final Bool? statut;
  const Exercise(
      {this.id,
      this.startDate,
      this.endDate,
      this.statut,
      });

  Map<String, dynamic> toMapWithId() {
    return {
      'id': id,
      'startDate': startDate,
      'endDate': endDate,
      'statut': statut
    };
  }
  Map<String, dynamic> toMapWithoutId() {
    return {
      'id': id,
      'startDate': startDate,
      'endDate': endDate,
      'statut': statut
    };
  }
  Future<dynamic> add() {
    Db db = Db();
    return db.add("exercises", toMapWithoutId());
  }
  Future<dynamic> activeExercse(int id) {
    Db db = Db();
    return db.updateActive("UPDATE exercises SET status=if(id=$id,1,0)", [id]);
  }
  Future<dynamic> getCurrentExercise() {
    Db db = Db();
    return db.get(" SELECT * FROM exercises WHERE status=1");
  }
  Future<dynamic> getAll() {
    Db db = Db();
    return db.get(" SELECT * FROM exercises");
  }
}

