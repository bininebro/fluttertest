import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Models/mydata.dart';

class DatabaseConnection {
  late Database _db;
  String table = 'EncryptedTable';
  Future<void> init() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'interviewDB');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE $table (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          encryptedText TEXT
        )
      ''');
    });
  }

  Future<void> insertData(MyData data) async {
    await _db.insert(table, data.toMap());
  }

  Future<List<MyData>> fetchData() async {
    final List<Map<String, dynamic>> maps = await _db.query(table);
    return List.generate(maps.length, (i) {
      return MyData.fromMap(maps[i]);
    });
  }
}
