import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import '../export.dart';

class DbProvider {
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'dbozark.db');
    debugPrint(path);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS tUser(userId TEXT PRIMARY KEY NOT NULL, fullname TEXT, password TEXT, phone TEXT,email TEXT,role TEXT)');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS tConfig(configId TEXT PRIMARY KEY NOT NULL,configName TEXT,configValue TEXT)');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS tExercice(exeId TEXT PRIMARY KEY NOT NULL,exeStart TEXT,exeEnd TEXT, exeStatus TEXT,exeName TEXT)');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS tDevise(deviseId TEXT PRIMARY KEY NOT NULL,deviseName TEXT, deviceSymbol TEXT)');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS tCategory(catId TEXT PRIMARY KEY NOT NULL,categoryName TEXT)');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS tProducts(proId TEXT PRIMARY KEY NOT NULL,proName TEXT,proCatId TEXT,FOREIGN KEY (proCatId) REFERENCES tCategory(catId),productMark TEXT)');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS tStock(stockId TEXT PRIMARY KEY NOT NULL,stockProductId TEXT,FOREIGN KEY (stockProductId) REFERENCES tProducts(proId), stockCode TEXT,stockDevise Text, stockQte TEXT,stockPU TEXT,stockPT TEXT,stockDateOp TEXT,stockDateExp TEXT,stockLotNum TEXT,stockUserId TEXT, FOREIGN KEY (stockUserId) REFERENCES tUser(userId))');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS tSell(sellId TEXT PRIMARY KEY NOT NULL,sellStockId TEXT,FOREIGN KEY (sellStockId) REFERENCES tStock(stockId),sellDevise TEXT,sellFactureId TEXT, FOREIGN KEY (sellFactureId) REFERENCES tFacture(factureId),sellUnity TEXT,sellQte TEXT,sellPU Text, sellPT TEXT,sellDateOp TEXT),sellPaidStatus TEXT');
    });
  }

  Future<int> addData(itemModel, table) async {
    final db = await init();
    return db.insert(
      table,
      itemModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<UserModel>> getUserData(table) async {
    final db = await init();
    final maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return UserModel(
          userid: maps[i]['userId'].toString(),
          fullname: maps[i]['fullname'].toString(),
          phone: maps[i]['phone'].toString(),
          email: maps[i]['email'].toString(),
          password: maps[i]['password'].toString(),
          role: maps[i]['role'].toString());
    });
  }
}
