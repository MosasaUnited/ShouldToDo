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
    await db.execute('''CREATE TABLE todos (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        todo TEXT NOT NULL,
        time TEXT NOT NULL,
        date TEXT NOT NULL )''');

    print('Create Database And Table ============ Done');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('onUpgrade ========================= Done');
    // دى لما نبقا عاوزين نضيف Column على ال Table من غير ما نحذف الداتا كلها
    // و نعمل Create من أول و جديد و لكن بشرط تغيير ال Version أولا
    // ملاحظة مهمة : لن يتم استدعاء onUpgrade إلا فى حالة تغيير ال Ver.

    // await db.execute("ALTER TABLE todos ADD COLUMN done INTEGER");
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

  // DELETE ALL DATABASE لمسح الداتا بيز بالكامل ( not recommended )
  myDeleteDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'mostafa.db');
    await deleteDatabase(path);
  }
}
