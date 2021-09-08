import 'dart:io';

import 'package:firebase_app_bloc/Database/ProductsData.dart';
import 'package:firebase_app_bloc/Database/UserData.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

///[DatabaseBuilder] Class for creating, versioning,upgrading, opening and closing the database.

class DatabaseBuilder {

  //Name of the database
  static final _databaseName = 'FirebaseApp.db';

  //Global database version
  static final _databaseVersion = 1;

  //Private constructor - for making singleton class
  DatabaseBuilder._privateConstructor();
  static final DatabaseBuilder instance = DatabaseBuilder._privateConstructor();

  //Nullable declaration of Database variable
  static Database? _database;

  //Getter to access and initialize the database instance
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDB();
      return _database;
    }
  }

  //Initializer method to open the database connection
  _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  //Creating database with the tables
  Future<void> _onCreate(Database db, int dbVersion) async {
    //Create the UserData table
    UserData userData = UserData();
    userData.createTable(db, dbVersion);

    //Create Products table
    ProductsData productsData = ProductsData();
    productsData.createDBTable(db, dbVersion);
  }

  //Updating the database with the updated tables
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion)async {
    //New configuration for database will go here...
  }

  //Closing the database connection
  Future<void> closeDB() async {
    Database db = await _initDB();
    db.close();
  }
}
