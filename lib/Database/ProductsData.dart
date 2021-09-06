import 'package:firebase_app_bloc/Database/Database.dart';
import 'package:sqflite/sqflite.dart';

class ProductsData {
  //Products Table
  static final tableName = 'Products';

  //Columns for table "ProductsData"

  //Product ID of the product
  static final productId = 'productId';

  //Name of the product
  static final productName = 'productName';

  //Availiable stock count
  static final productStockCount = 'stockQuantity';

  //Minimum stock quantity
  static final minimumStockQuantity = 'minimumStockQuantity';

  //Short description of the product
  static final productShortDescription = 'productShortDescription';

  //Full description of the product
  static final productFullDescription = 'productFullDescription';

  //Vendor ID for the product
  static final vendorId = 'vendorId';

  //Flag for product if it is out of stock
  static final isOutOfStock = 'isOutOfStock';

  //Price of the product
  static final productPrice = 'productPrice';

  //Old price of the product
  static final productOldPrice = 'productOldPrice';

  //Tax in percentage of the product
  static final productTax = 'productTax';

  //Reviews ID for the product - Mapped to Reviews table
  static final productCustomerReviews = 'customerReviews';

  //Rating count of the product (in decimal)
  static final productCustomerRatings = 'customerRating';

  //Product Added date
  static final productAddedDate = 'productAddedDateTime';

  //Product Updated date
  static final productUpdatedDate = 'productUpdatedDateTime';

  //Product discount percentage
  static final productDiscount = 'productDiscount';

  //Dynamic function to create Products table
  createDBTable(Database db, int dbVersion) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $productId INTEGER PRIMARY KEY,
        $productName TEXT NOT NULL,
        $productStockCount INTEGER NOT NULL DEFAULT 0,
        $minimumStockQuantity INTEGER NOT NULL DEFAULT 0,
        $isOutOfStock INTEGER NOT NULL DEFAULT 0,
        $productPrice REAL NOT NULL DEFAULT 0.0,
        $productOldPrice REAL NOT NULL DEFAULT 0.0,
        $productTax REAL NOT NULL DEFAULT 0.0,
        $productCustomerReviews INTEGER NOT NULL DEFAULT 0,
        $productCustomerRatings INTEGER NOT NULL DEFAULT 0,
        $productDiscount REAL NOT NULL DEFAULT 0.0,
        $productAddedDate TEXT NOT NULL DEFAULT (strftime('%Y-%m-%d %H:%M:%S', 'now', 'localtime')),
        $productUpdatedDate TEXT NOT NULL DEFAULT (strftime('%Y-%m-%d %H:%M:%S', 'now', 'localtime'))
      )
      ''');
  }

  //Function to add a product into Products table
  Future<int> addProduct(Map<String, dynamic> product) async {
    Database? db = await DatabaseBuilder.instance.database;
    return await db!.insert(tableName, product);
  }

  //Function to delete a product by productId from Products table
  Future<int> deleteProduct(int productId) async {
    Database? db = await DatabaseBuilder.instance.database;
    return await db!
        .delete(tableName, where: '$productId = ?', whereArgs: [productId]);
  }

  //Function to update any existing product in Products table
  Future<int> updateProduct(Map<String, dynamic> product) async {
    Database? db = await DatabaseBuilder.instance.database;
    return await db!.update(tableName, product,
        where: '$productId = ?', whereArgs: [productId]);
  }

  //Function to fetch all the products from Products table
  Future<List<Map<String, dynamic>>> getAllProducts() async {
    Database? db = await DatabaseBuilder.instance.database;
    return await db!.query(tableName);
  }

  //Function to print all the records from Products table
  Future<void> printTable() async {
    List<Map<String, dynamic>> products = await getAllProducts();
    print('Products table with ${products.length} entries.');
    products.forEach((element) => print(element));
  }
}
