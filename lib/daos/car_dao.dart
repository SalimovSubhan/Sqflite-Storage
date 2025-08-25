import 'package:sqflite_storage/db/app_db.dart';

class CarDao {
  final AppDb database = AppDb();

  Future getAllCar() async {
    final db = await database.getinitDb();
    await db.query('Car');
  }

  Future<int> insertCar({required String name, required int age}) async {
    final db = await database.getinitDb();
    return await db.insert('Car', {'name': name, 'age': 'age'});
  }

  Future<int> deleteCar({required int id}) async {
    final db = await database.getinitDb();
    return await db.delete('Car', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateCar({
    required String name,
    required int age,
    required int id,
  }) async {
    final db = await database.getinitDb();
    return await db.update(
      'Car',
      where: 'id = ?',
      whereArgs: [id],
      {'name': name, 'age': age},
    );
  }
}
