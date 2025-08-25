import 'package:sqflite_storage/db/app_db.dart';

class DogDao {
  final AppDb appDb = AppDb();

  Future insertDog({required String name, required int age}) async {
    final db = await appDb.getinitDb();
    await db.insert('Dog', {'name': name, 'age': age});
  }

  Future getAllDogs() async {
    final db = await appDb.getinitDb();
    final result = await db.query('Dog');
    return result;
  }

  Future<int> deleteDog({required int id}) async {
    final db = await appDb.getinitDb();
    return await db.delete('Dog', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateDog({
    required String name,
    required int age,
    required int id,
  }) async {
    final db = await appDb.getinitDb();
    return await db.update(
      'Dog',
      {'name': name, 'age': age},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
