import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class DbProvider {
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'atstock.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE IF NOT EXISTS tUser(userid TEXT PRIMARY KEY NOT NULL, fullname TEXT, password TEXT, phone TEXT,email TEXT,role TEXT)');
      await db.execute('CREATE TABLE IF NOT EXISTS tConfig(configId TEXT PRIMARY KEY NOT NULL,configName TEXT,configValue TEXT)');
      await db.execute('CREATE TABLE IF NOT EXISTS tExercice(exeId TEXT PRIMARY KEY NOT NULL,exeStart TEXT,exeEnd TEXT, exeStatus TEXT,exeName TEXT)');
      await db.execute('CREATE TABLE IF NOT EXISTS tDevise(deviseId TEXT PRIMARY KEY NOT NULL,deviseName TEXT, deviceSymbol TEXT)');
      await db.execute('CREATE TABLE IF NOT EXISTS tProducts(proId TEXT PRIMARY KEY NOT NULL,proName TEXT, proCategory TEXT, proMark TEXT)');
      await db.execute('CREATE TABLE IF NOT EXISTS tProvide(proId TEXT PRIMARY KEY NOT NULL,proDate TEXT, prodateOp TEXT,proCost Text, proDevise TEXT,proUser TEXT)');
      await db.execute('CREATE TABLE IF NOT EXISTS tStock(stockId TEXT PRIMARY KEY NOT NULL,productId TEXT,FOREIGN KEY (productId) REFERENCES tProducts(proId),provideId TEXT, FOREIGN KEY (provideId) REFERENCES tProvide(proId), stockCode TEXT,stockDevise Text, stockQte TEXT,stockPU TEXT,stockPT TEXT,stockDateOp TEXT,stockDateExp TEXT,stockLotNum TEXT)');
      await db.execute('CREATE TABLE IF NOT EXISTS tSell(sellId TEXT PRIMARY KEY NOT NULL,stockId TEXT,FOREIGN KEY (stockId) REFERENCES tStock(stockId),devise TEXT,factureId TEXT, FOREIGN KEY (factureId) REFERENCES tFacture(factureId),sellUnity TEXT,sellQty TEXT,sellPu Text, sellPT TEXT,sellDateOp TEXT)');
      await db.execute('CREATE TABLE IF NOT EXISTS tFacture(factureId TEXT PRIMARY KEY NOT NULL,clientId TEXT,FOREIGN KEY (clientId) REFERENCES tClient(clientId),facDateOp TEXT ,facDescription TEXT,exeId TEXT, FOREIGN KEY (exeId) REFERENCES tExercice(exeId),,userId TEXT, FOREIGN KEY (userId) REFERENCES tUser(userId))');
    });
  }
}
