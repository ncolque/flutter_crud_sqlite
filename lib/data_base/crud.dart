import 'package:flutter_crud_sqlite/data_base/db.dart';
import 'package:sqflite/sqflite.dart';

abstract class Crud {
  String table;
  Crud(this.table);

  Future<Database> get database async {
    return await Db().open();
  }

  query(String sql, {List<dynamic> arguments = const []}) async {
    return (await database).rawQuery(sql, arguments);
  }

  create(Map<String, dynamic> data) async {
    return (await database).insert(table, data);
  }

  update(Map<String, dynamic> data) async {
    return (await database)
        .update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  delete(int id) async {
    return (await database).delete(table, where: 'id=?', whereArgs: [id]);
  }
}
