import 'package:sqflite/sqflite.dart';

import 'tables.dart';

class DBMigrations {
  static Future<void> createTables(Database db) async {
    await db.execute('''
      CREATE TABLE ${DBTables.animalTable}(
        ${DBTables.id} INTEGER PRIMARY KEY AUTOINCREMENT,

        ${DBTables.numeroBoucle} TEXT UNIQUE NOT NULL,

        ${DBTables.espece} TEXT NOT NULL,

        ${DBTables.race} TEXT NOT NULL,

        ${DBTables.sexe} TEXT NOT NULL,

        ${DBTables.couleurRobe} TEXT,

        ${DBTables.dateNaissance} TEXT,

        ${DBTables.poids} REAL,

        ${DBTables.statutPhysiologique} TEXT,

        ${DBTables.etatSanitaire} TEXT,

        ${DBTables.origine} TEXT,

        ${DBTables.numeroBoucleMere} TEXT,

        ${DBTables.statutAnimal} TEXT,

        ${DBTables.observations} TEXT
      )
    ''');
  }
}
