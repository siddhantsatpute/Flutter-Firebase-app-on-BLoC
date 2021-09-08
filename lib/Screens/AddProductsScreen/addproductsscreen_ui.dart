import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:firebase_app_bloc/Screens/AddProductsScreen/addproductsscreen_bloc.dart';
import 'package:firebase_app_bloc/Models/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  late AddproductsscreenBloc _addproductsscreenBloc;

  Widget spaceWidget = SizedBox(
    height: 15,
  );

  TextEditingController _productNameController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();
  TextEditingController _productOldPriceController = TextEditingController();
  TextEditingController _productStockQuantityController =
      TextEditingController();
  TextEditingController _productMinimumQuantityController =
      TextEditingController();
  TextEditingController _productTaxController = TextEditingController();
  TextEditingController _productDiscountController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _addproductsscreenBloc = AddproductsscreenBloc();
    _addproductsscreenBloc.add(AddProductInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => _addproductsscreenBloc,
        child: BlocListener<AddproductsscreenBloc, AddproductsscreenState>(
          listener: (context, state) {
            log('Current State : $state');

            //Add non binded widgets here...
            if (state is AddProductInProgressState) {
              Timer(Duration(seconds: 3),
                  () => _addproductsscreenBloc.add(AddProductSuccessEvent()));
              showLoader(context);
            } else if (state is AddProductSuccessState) {
              //_addproductsscreenBloc.add(AddProductInitialEvent());
              hideLoader(context);
              Navigator.pop(context);
            }
          },
          child: BlocBuilder<AddproductsscreenBloc, AddproductsscreenState>(
              builder: (context, state) {
            //Return UI from here as per the state triggered...
            if (state is AddProductInitialState) {
              return addProductsBody(context);
            } else if (state is AddProductInitiatedState) {
              Products product = new Products(
                  productName: _productNameController.text,
                  stockQuantity:
                      int.parse(_productStockQuantityController.text),
                  minimumStockQuantity:
                      int.parse(_productMinimumQuantityController.text),
                  isOutOfStock: false,
                  productPrice: _productPriceController.text != ''
                      ? double.parse(_productPriceController.text)
                      : 0.0,
                  productOldPrice: _productOldPriceController.text != ''
                      ? double.parse(_productOldPriceController.text)
                      : 0.0,
                  productTax: _productTaxController.text != ''
                      ? double.parse(_productTaxController.text)
                      : 0.0,
                  customerReviews: 0,
                  customerRating: 0.0,
                  productDiscount: _productDiscountController.text != ''
                      ? double.parse(_productDiscountController.text)
                      : 0.0,
                  productAddedDateTime: DateTime.now(),
                  productUpdatedDateTime: DateTime.now());

              _addproductsscreenBloc
                  .add(AddProductInProgressEvent(product: product));
            } else if (state is AddProductFailureState) {
              _addproductsscreenBloc.add(AddProductInitialEvent());
              hideLoader(context);
            } else {
              print(
                  'Add Product Screen Unknown State. Please check the BLoC file.');
              _addproductsscreenBloc.add(AddProductInitialEvent());
            }

            return Container();
          }),
        ),
      ),
    ));
  }

  //Add product UI body
  Widget addProductsBody(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: ListView(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _productNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            spaceWidget,
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _productPriceController,
              decoration: InputDecoration(
                labelText: 'Price',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            spaceWidget,
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _productOldPriceController,
              decoration: InputDecoration(
                labelText: 'Old Price',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            spaceWidget,
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _productStockQuantityController,
              decoration: InputDecoration(
                labelText: 'Stock Quantity',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            spaceWidget,
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _productMinimumQuantityController,
              decoration: InputDecoration(
                labelText: 'Minimum Stock Quantity',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            spaceWidget,
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _productTaxController,
              decoration: InputDecoration(
                labelText: 'Tax',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            spaceWidget,
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _productDiscountController,
              decoration: InputDecoration(
                labelText: 'Discount',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            spaceWidget,
            ElevatedButton(
              onPressed: () async {
                _addproductsscreenBloc.add(AddProductInitiatedEvent());
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 50), primary: Colors.blue),
              child: Text(
                'Add Product',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }

  //Display the loading on main UI when adding product into database
  showLoader(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              child: Center(
                  child: Container(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                    Text(
                      'Loading...',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
            ),
          );
        });
  }

  //Hides the loading from main UI
  void hideLoader(BuildContext context) {
    Navigator.pop(context);
  }
}
