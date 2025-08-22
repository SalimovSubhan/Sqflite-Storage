import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  Database? database;

  Future<Database> getinitDb() async {
    if (database != null && database!.isOpen) {
      return database!;
    } else {
      await initDatabase();
      return database!;
    }
  }

  Future<void> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE Car (
     id INTEGER PRIMARY KEY,
     name TEXT,
     age INTEGER
     )''');
      },
    );
  }
}
