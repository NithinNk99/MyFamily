import 'package:sqflite/sqflite.dart';

import 'dbconnection.dart';
// import 'package:todoo/db_connection.dart';

class Repo {
  late DatabaseConnection _databaseConnection;
  Repo() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  // insertData(table, data) async {
  //   var connection = await database;
  //   return await connection?.insert(table, data);
  // }
  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  readUser(String email, String password) async {
    var connection = await database;

    return await connection?.rawQuery(
        "SELECT * FROM login WHERE email = '$email' and password = '$password'");
  }

  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  deleteData(table, memberId) async {
    var connection = await database;
    return await connection
        ?.rawDelete("delete from $table where id=?", [memberId]);
  }

  updateData(table, data) async {
    var connection = await database;
    return await connection?.rawUpdate(
        'UPDATE ${table} SET status=? WHERE id = ?',
        [data['status'], data['id']]);
  }
}
