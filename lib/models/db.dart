import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  static final Db instance = Db._instance();
  static Database database = Null as Database;
  Db._instance();

  /// constructeur null
  Db();

  /// initialisation de la base de donnees
  Future<Database> get db async {
    database = await createDatabase();
    return database;
  }

  /// creation de la base de bonnees et ouverture de connection
  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'atstock.db');
    var database = await openDatabase(path, version: 1, onCreate: dbTables);
    return database;
  }

  /// creation des tables
  void dbTables(Database database, int version) async {

    await database.execute(
        'CREATE TABLE IF NOT EXISTS `users` (`id`	INTEGER PRIMARY KEY AUTOINCREMENT, `name`	varchar ( 100 ) DEFAULT NULL,`username`	varchar ( 100 ) DEFAULT NOT NULL,`password`	varchar ( 50 ) DEFAULT NULL,`phone_number`	varchar ( 20 ) DEFAULT NULL,`role`	varchar ( 20 ) DEFAULT NULL);');
    
  }

  /// cette methode [add] permet d'ajouter une nouvelle occurence
  /// * @param @String [table] le nom de la table
  /// * @param @list [field] une liste de colonne
  /// * @param @list [value] une liste de valeurs
  /// * @return @Map un dictionaire : status et result

  Future<dynamic> add(String table, Map<String, Object?> values) async {
    Database db = await this.db;
    final result = await db.insert(table, values,
        conflictAlgorithm: ConflictAlgorithm.replace);
    if (result > 0) {
      var data = await db.rawQuery("select * from $table where id=$result");
      return {"status": 200, "data": data.toList()};
    } else {
      return {"status": 400};
    }
  }

  /// cette methode [update] permet la modification d'une occurence
  /// * @param @String [query] la requette
  /// * @param @list [value] une liste de valeur
  /// * @return @Map un dictionaire : status et data

  Future<dynamic> update(String table, Map<String, Object?> values,
      String? where, List<Object?>? whereArgs) async {
    Database db = await this.db;
    var result =
        await db.update(table, values, where: where, whereArgs: whereArgs);
    if (result > 0) {
      var data = await db.rawQuery("select * from $table where id=$whereArgs");
      return {"status": 200, "data": data.toList()};
    } else {
      return {"status": 400};
    }
  }

  /// cette methode [fetch] permet selectionner des element
  /// * @param @String [query] la requette d'insertion
  /// * @return @Map un dictionaire : status et data
  Future< dynamic> fetch(String query) async {
    Database db = await this.db;
    var data = await db.rawQuery(query);
    if (data is List) {
      return {"status": 200, "result": data.toList()};
    } else {
      return {"status": 400};
    }
  }



  /// cette methode [delete] permet de supprimer une occurence
  /// * @param @String [query] la requette de suppression
  /// * @return @Map un dictionaire : status 
  Future<dynamic> delete(
      String table, String? where, List<Object?>? whereArgs) async {
    Database db = await this.db;
    final int result =
        await db.delete(table, where: where, whereArgs: whereArgs);
    if (result > 0) {
      return {"status": 200};
    } else {
      return {"status": 400};
    }
  }
}
