import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();

    String path = join(databasePath, 'mostafa.db');

    Database myDb = await openDatabase(path,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);

    return myDb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE "todos"(
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT  , 
        "todo" TEXT NOT NULL ,
        "time" TEXT NOT NULL ,
    )
  ''');

    print('Create Database And Table ============ Done');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    print('onUpgrade ========================= Done');
  }

  //SELECT DATABASE
  selectData(String sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(sql);
    return response;
  }

  //INSERT DATA
  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  // UPDATE DATA
  updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  // DELETE DATA
  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }
}
