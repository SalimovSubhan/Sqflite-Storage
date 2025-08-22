import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDb {
  Database? database;

  Future<Database> getinitDb() async {
    if (database != null && database!.isOpen) {
      return database!;
    } else {
      await _initDatabase();
      return database!;
    }
  }

  Future<void> _initDatabase() async {
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
