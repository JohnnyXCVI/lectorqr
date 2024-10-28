import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();
  
  Future<Database?> get database async {
    if (_database != null){
      return _database;      
    }else{
      _database = await initDB();
    } 
    return _database;
  }

  Future<Database> initDB() async {
    //Path para almacenar la BD
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    //crear BD
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY key,
            tipo TEXT,
            valor TEXT
          )
        ''');
    });
  }
}
