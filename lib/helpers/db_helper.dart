import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
      return _db;
    } else {
      return _db;
    }
  }

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "tasks.db");
    Database db = await openDatabase(path, onCreate: (db, version) {
      return db.execute('''
        CREATE TABLE tasks (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, task TEXT, complete TEXT);
      ''');
    }, version: 1);
    return db;
  }

  readData(String sql) async {
    var mydb = await db;
    var response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    var mydb = await db;
    var response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    var mydb = await db;
    var response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    var mydb = await db;
    var response = await mydb!.rawDelete(sql);
    return response;
  }
}
