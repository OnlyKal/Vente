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
    // users table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `users` (`id`	INTEGER PRIMARY KEY AUTOINCREMENT, `name`	varchar ( 100 ) DEFAULT NULL,`username`	varchar ( 100 ) DEFAULT NOT NULL,`password`	varchar ( 50 ) DEFAULT NULL,`phone_number`	varchar ( 20 ) DEFAULT NULL,`role`	varchar ( 20 ) DEFAULT NULL);');
    //exercise table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `exircise` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`start_date`	TIMESTAMP ,`end_date`	TIMESTAMP,`Statut`	BOOLEAN NOT NULL DEFAULT 0);');
        // config general table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `config_general` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`name`	varchar ( 50 ) DEFAULT NULL,`value`	text);');
        // etablishement table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `etablishement` (`name`	varchar ( 100 ) DEFAULT NULL,`phone_number`	varchar ( 20 ) DEFAULT NULL,`email`	varchar ( 100 ) DEFAULT NULL,`description`	varchar ( 100 ) DEFAULT NULL);');
    // unit of mesure table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `unit_of_measure` (`id`	INTEGER PRIMARY KEY AUTOINCREMENT,`name`	varchar ( 100 ) DEFAULT NULL,`symbole`	varchar (5) DEFAULT NULL);');
    // currencies table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `currencies` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`name`varchar ( 50 ) DEFAULT NULL,`symbole`varchar ( 50 ) DEFAULT NULL);');
    // clients table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `clients` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`name`	varchar ( 100 ) DEFAULT NULL,`adress`	varchar ( 255 ) DEFAULT NULL,`phone_number`	varchar ( 20 ) DEFAULT NULL);');
    // clients table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `categories` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`name`	varchar ( 255 ) DEFAULT NULL);');
    // supply table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `supply` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date_supply` TIMESTAMP, `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, `amount`	float DEFAULT 0,`currency_id`	INTEGER, `user_id`	INTEGER,`exercise_id` INTEGER);');
    // stock table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `stock` ( `id` INTEGER PRIMARY KEY AUTOINCREMENT,`supply_id`	INTEGER ,`product_id`	INTEGER,`code`	varchar ( 50 ) DEFAULT NULL, `currency_id`	INTEGER,`quantity`	float DEFAULT NULL,`unit_price`	float DEFAULT NULL,`unit_of_measure`	INTEGER,`expiration_date`	TIMESTAMP, `manufacturing_date`	TIMESTAMP ,`exercise_id` INTEGER,`lot_number`	varchar ( 100 ) DEFAULT ' ');');
    // invoince table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `invoince` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`client_id`	INTEGER,`invoince_date`	TIMESTAMP,`create_at`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`Description`	text,`user_id`	INTEGER ,`exercise_id`	INTEGER );');
    
    // invoince table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `services` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`currency_id`	INTEGER,`invoince_id`	INTEGER ,`quantity`	float,`unit_price`	float,`description`	varchar ( 255 ),`served_date`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`id_product`	INTEGER);');
    // note table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `note` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`number`	VARCHAR ( 10 ) NOT NULL,`invoice_id`	INTEGER ,`amount`	float DEFAULT 0,`currency_id`	INTEGER,`note_date`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`exercise_id`	INTEGER ,`user_id`	INTEGER);');
    // sales table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `sales` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`stock_id`	INTEGER,`currency_id`	INTEGER,`invoince_id`	INTEGER,`unit_of_measure_id`	int ( 10 ) DEFAULT NULL,`quantity`	float DEFAULT NULL,`unite_price`	float DEFAULT NULL,`sale_date`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`exercise_id`	INTEGER );');
    // cash table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `cash` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`curreny_id`	INTEGER,`date_cash`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`exercise_id` INTEGER,`courier`	varchar ( 30 ) NOT NULL,`amount`	float DEFAULT 0,`exercise_id`	INTEGER ,`user_id`	INTEGER,`comment`	varchar ( 100 ) );');
    // cash table
    await database.execute(
        'CREATE TABLE IF NOT EXISTS `inventories` (`id` INTEGER PRIMARY KEY AUTOINCREMENT,`exercise_id`	INTEGER,`product_id`	INTEGER,`theoretical_inventory`	float DEFAULT 0,`physical_inventory`	float DEFAULT 0,`inventory_cash`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,`user_id`	INTEGER);');
    
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
