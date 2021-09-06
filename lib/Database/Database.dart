import 'dart:io';

import 'package:firebase_app_bloc/Database/ProductsData.dart';
import 'package:firebase_app_bloc/Database/UserData.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseBuilder {
  static final _databaseName = 'FirebaseApp.db';
  static final _databaseVersion = 1;

  DatabaseBuilder._privateConstructor();
  static final DatabaseBuilder instance = DatabaseBuilder._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDB();
      return _database;
    }
  }

  _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int dbVersion) async {
    //Create the UserData table
    UserData userData = UserData();
    userData.createTable(db, dbVersion);

    //Create Products table
    ProductsData productsData = ProductsData();
    productsData.createDBTable(db, dbVersion);
  }
}
