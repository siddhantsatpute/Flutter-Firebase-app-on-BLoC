import 'package:firebase_app_bloc/Database/Database.dart';
import 'package:firebase_app_bloc/Models/Products.dart';
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
        $productCustomerReviews REAL NOT NULL DEFAULT 0,
        $productCustomerRatings REAL NOT NULL DEFAULT 0,
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

  //Function to fetch all the products from "Products" table.
  //Returns Products list if no data found in database then empty list.
  Future<List<Products>> getAllProducts() async {
    //Getting database instance
    Database? db = await DatabaseBuilder.instance.database;
    //Executing query to fetch the products from "Products" table
    List<Map<String, dynamic>> productsMapList = await db!.query(tableName);
    //Initializing "Products" list
    List<Products> products = [];
    if (productsMapList.isNotEmpty) {
      //Iterating over query result
      productsMapList.forEach((productMap) {
        //Converting map into object
        Products product = Products.fromMap(productMap);
        //Adding object into list
        products.add(product);
      });
    }
    //Returning list as result
    return products;
  }

  //Function to fetch Products by product ID, returns null if not found.
  Future<Products?> getProductByProductID(String productID) async {
    //Getting database instance
    Database? db = await DatabaseBuilder.instance.database;
    //Executing query to fetch the product from "Products" table
    List<Map<String, dynamic>> productListmap = await db!
        .query(tableName, where: '$productID = ?', whereArgs: [productID]);
    if (productListmap.isEmpty) {
      //Return null if no data found in database
      return null;
    }
    //Converting map into object
    Products product = Products.fromMap(productListmap[0]);
    //Returning product as result
    return product;
  }

  //Function to print all the records from Products table
  Future<void> printTable() async {
    List<Products> products = await getAllProducts();
    //Iterate and print each product data
    products.forEach((element) => print(element));
  }
}
