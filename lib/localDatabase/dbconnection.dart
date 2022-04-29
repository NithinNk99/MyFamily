import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getExternalStorageDirectory();

    var path = join(directory?.path ?? '', 'db_login');

    var database =
        await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    String sql =
        "CREATE TABLE login (id INTEGER PRIMARY KEY, name TEXT, email TEXT , age TEXT ,password TEXT,confirmPassword TEXT );";
    await database.execute(sql);
  }
}
