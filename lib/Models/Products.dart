import 'dart:convert';

class Products {
  //ID of the product
  int? productId;

  //Name of the product
  String? productName;

  //Available quantity of product
  int? stockQuantity;

  //Minimum quantity of product
  int? minimumStockQuantity;

  //Flag for out of stock
  bool? isOutOfStock;

  //Price of the product
  double? productPrice;

  //Old price of the product
  double? productOldPrice;

  //Tax of the product
  double? productTax;

  //Customer Reviews count
  double? customerReviews;

  //Customer rating count
  double? customerRating;

  //Discount on product
  double? productDiscount;

  //Date & time of the product when added
  DateTime? productAddedDateTime;

  //Last updated date & time of the product
  DateTime? productUpdatedDateTime;

  Products({
    this.productId,
    this.productName,
    this.stockQuantity,
    this.minimumStockQuantity,
    this.isOutOfStock,
    this.productPrice,
    this.productOldPrice,
    this.productTax,
    this.customerReviews,
    this.customerRating,
    this.productDiscount,
    this.productAddedDateTime,
    this.productUpdatedDateTime,
  });

  Products copyWith({
    int? productId,
    String? productName,
    int? stockQuantity,
    int? minimumStockQuantity,
    bool? isOutOfStock,
    double? productPrice,
    double? productOldPrice,
    double? productTax,
    double? customerReviews,
    double? customerRating,
    double? productDiscount,
    DateTime? productAddedDateTime,
    DateTime? productUpdatedDateTime,
  }) {
    return Products(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      minimumStockQuantity: minimumStockQuantity ?? this.minimumStockQuantity,
      isOutOfStock: isOutOfStock ?? this.isOutOfStock,
      productPrice: productPrice ?? this.productPrice,
      productOldPrice: productOldPrice ?? this.productOldPrice,
      productTax: productTax ?? this.productTax,
      customerReviews: customerReviews ?? this.customerReviews,
      customerRating: customerRating ?? this.customerRating,
      productDiscount: productDiscount ?? this.productDiscount,
      productAddedDateTime: productAddedDateTime ?? this.productAddedDateTime,
      productUpdatedDateTime:
          productUpdatedDateTime ?? this.productUpdatedDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'stockQuantity': stockQuantity,
      'minimumStockQuantity': minimumStockQuantity,
      'isOutOfStock': isOutOfStock! ? 1 : 0,
      'productPrice': productPrice,
      'productOldPrice': productOldPrice,
      'productTax': productTax,
      'customerReviews': customerReviews,
      'customerRating': customerRating,
      'productDiscount': productDiscount,
      'productAddedDateTime': productAddedDateTime?.toString(),
      'productUpdatedDateTime': productUpdatedDateTime?.toString(),
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      productId: map['productId'],
      productName: map['productName'],
      stockQuantity: map['stockQuantity'],
      minimumStockQuantity: map['minimumStockQuantity'],
      isOutOfStock: map['isOutOfStock'] == 1 ? true : false,
      productPrice: map['productPrice'],
      productOldPrice: map['productOldPrice'],
      productTax: map['productTax'],
      customerReviews: map['customerReviews'],
      customerRating: map['customerRating'],
      productDiscount: map['productDiscount'],
      productAddedDateTime:
          DateTime.parse(map['productAddedDateTime']),
      productUpdatedDateTime:
          DateTime.parse(map['productUpdatedDateTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Products(productId: $productId, productName: $productName, stockQuantity: $stockQuantity, minimumStockQuantity: $minimumStockQuantity, isOutOfStock: $isOutOfStock, productPrice: $productPrice, productOldPrice: $productOldPrice, productTax: $productTax, customerReviews: $customerReviews, customerRating: $customerRating, productDiscount: $productDiscount, productAddedDateTime: $productAddedDateTime, productUpdatedDateTime: $productUpdatedDateTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Products &&
        other.productId == productId &&
        other.productName == productName &&
        other.stockQuantity == stockQuantity &&
        other.minimumStockQuantity == minimumStockQuantity &&
        other.isOutOfStock == isOutOfStock &&
        other.productPrice == productPrice &&
        other.productOldPrice == productOldPrice &&
        other.productTax == productTax &&
        other.customerReviews == customerReviews &&
        other.customerRating == customerRating &&
        other.productDiscount == productDiscount &&
        other.productAddedDateTime == productAddedDateTime &&
        other.productUpdatedDateTime == productUpdatedDateTime;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        productName.hashCode ^
        stockQuantity.hashCode ^
        minimumStockQuantity.hashCode ^
        isOutOfStock.hashCode ^
        productPrice.hashCode ^
        productOldPrice.hashCode ^
        productTax.hashCode ^
        customerReviews.hashCode ^
        customerRating.hashCode ^
        productDiscount.hashCode ^
        productAddedDateTime.hashCode ^
        productUpdatedDateTime.hashCode;
  }
}
