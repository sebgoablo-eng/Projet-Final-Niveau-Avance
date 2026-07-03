import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:agritroupeau/config/constants.dart';
import 'migrations.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), AppConstants.databaseName);

    return openDatabase(
      path,
      version: AppConstants.databaseVersion,
      onCreate: (db, version) async {
        await DBMigrations.createTables(db);
      },
    );
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;

    return db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    final db = await database;

    return db.query(table);
  }

  Future<Map<String, dynamic>?> queryById(String table, int id) async {
    final db = await database;

    final result = await db.query(table, where: "id=?", whereArgs: [id]);

    if (result.isEmpty) return null;

    return result.first;
  }

  Future<int> update(String table, Map<String, dynamic> data, int id) async {
    final db = await database;

    return db.update(table, data, where: "id=?", whereArgs: [id]);
  }

  Future<int> delete(String table, int id) async {
    final db = await database;

    return db.delete(table, where: "id=?", whereArgs: [id]);
  }

  Future close() async {
    final db = await database;

    db.close();
  }
}

class AppConstants {
  static const String databaseName = 'agritroupeau.db';
  static const int databaseVersion = 1;
}
