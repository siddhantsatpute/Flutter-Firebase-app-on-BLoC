import 'package:firebase_app_bloc/Database/Database.dart';
import 'package:sqflite/sqflite.dart';

///Class to handle and store the User data and their records into database
class UserData {
  //Name of the table
  static final tablename = 'UserData';
  //Columns of the table
  //ID column
  static final userId = 'id';
  //Name column
  static final userName = 'name';
  //Password column
  static final password = 'password';

  //Dynamic function to create UserData table
  createTable(Database db, int dbVersion) async {
    await db.execute('''
      CREATE TABLE $tablename (
        $userId INTEGER PRIMARY KEY,
        $userName TEXT NOT NULL,
        $password TEXT NOT NULL
      )
      ''');
  }

  //Function to Insert User record into database
  Future<int> insertUserData(Map<String, dynamic> user) async {
    Database? db = await DatabaseBuilder.instance.database;
    return await db!
        .insert(tablename, user, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //Function to Fetch All User records from database
  Future<List<Map<String, dynamic>>> fetchAllUserData() async {
    Database? db = await DatabaseBuilder.instance.database;
    return await db!.query(tablename);
  }

  //Function to Fetch a User record from database
  Future<List<Map<String, dynamic>>> fetchUser(
      String? email, String? pass) async {
    Database? db = await DatabaseBuilder.instance.database;
    return await db!.query(tablename,
        where: '$userName = ? AND $password = ?', whereArgs: [email, pass]);
  }

  //Function to Update a particular user record
  Future<int> updateUserData(Map<String, dynamic> userUpdate) async {
    Database? db = await DatabaseBuilder.instance.database;
    int id = userUpdate[userId];
    return await db!
        .update(tablename, userUpdate, where: '$userId = ?', whereArgs: [id]);
  }

  //Function to delete a particular user record
  Future<int> deleteUserData(int id) async {
    Database? db = await DatabaseBuilder.instance.database;
    return await db!.delete(tablename, where: '$userId = ?', whereArgs: [id]);
  }

  //Prints the table UserData
  printTable() async {
    List<Map<String, dynamic>> userData = await fetchAllUserData();
    print('UserData table with ${userData.length} entries.');
    userData.forEach((element) => print(element));
  }
}
