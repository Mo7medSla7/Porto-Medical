import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase{
  static final MyDatabase instance =   MyDatabase._init();

  static Database? _database;

  MyDatabase._init();

  Future<Database> get database async{
    if(_database != null ) return _database!;
    _database = await _initDB('emails.dp');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    Directory directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path,filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );

  }

    Future _createDB(Database db, int version) async {
       await db.execute('''
       CREATE TABLE emails (_id INTEGER PRIMARY KEY AUTOINCREMENT,
       senderName TEXT,
       senderEmail TEXT,
       emailSubject TEXT,
       message TEXT)
       ''');
    }

    void insertEmail(String name,String email,String subject,String message) async{
      final db = await  instance.database;
      await db.rawInsert('INSERT INTO emails (senderName,senderEmail,emailSubject,message) VALUES ("$name","$email","$subject","$message")');
    }

    Future<List<Map<String, Object?>>> selectAll() async{
      final db = await  instance.database;
      return db.rawQuery('SELECT * FROM emails');
    }
    Future close() async{
      final db = await instance.database;
      db.close();
    }

}