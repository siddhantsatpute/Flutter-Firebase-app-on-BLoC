import 'dart:developer';

import 'package:firebase_app_bloc/Models/Products.dart';
import 'package:firebase_app_bloc/Screens/AddProductsScreen/addproductsscreen_ui.dart';
import 'package:firebase_app_bloc/Screens/ProductsListingScreen/productslistingscreen_bloc.dart';
import 'package:firebase_app_bloc/Utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListingScreen> {
  late ProductslistingscreenBloc _productslistingscreenBloc;

  List<Products> productsList = [];

  @override
  void initState() {
    super.initState();
    _productslistingscreenBloc = ProductslistingscreenBloc();
    _productslistingscreenBloc.add(ProductsListingInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => _productslistingscreenBloc,
        child:
            BlocListener<ProductslistingscreenBloc, ProductslistingscreenState>(
          listener: (context, state) async {
            //Handle the non binded UI widgets here...

            //Product listing loading state
            if (state is ProductsListingLoadingState) {
              showLoader(context);
            }

            //State to move to AddProductsScreen
            else if (state is ProductsListingMoveToAddproductsState) {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddProductsScreen(), maintainState: true));

              _productslistingscreenBloc.add(ProductsListingInitialEvent());
            }
          },
          child: BlocBuilder<ProductslistingscreenBloc,
              ProductslistingscreenState>(builder: (context, state) {
            //Product listing initial state
            if (state is ProductsListingInitialState) {
              _productslistingscreenBloc.add(ProductsListingLoadingEvent());
              return productsListUI();
            }

            //Product listing load success state
            else if (state is ProductsListingLoadSuccessState) {
              productsList = state.products;

              log('Products :: $productsList');
              //Hide the loader
              hideLoader(context);
              return productsListUI();
            }

            //Product listing load failed state
            else if (state is ProductsListingLoadFailedState) {
              //Hide the loader
              hideLoader(context);
              _productslistingscreenBloc.add(ProductsListingInitialEvent());
            }

            //Product listing load unknown state
            else if (state is ProductsListingLoadUnknownState) {
              print('Check ProductsListingBloc BLoC code. unknown state found');
            }
            return Container();
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          //Add bloc state to navigate to Add Products Screen
          _productslistingscreenBloc
              .add(ProductsListingMoveToAddproductsEvent());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    ));
  }

  //Widget to show Product listing UI
  Widget productsListUI() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: ListView.builder(
          itemCount: productsList.length,
          itemBuilder: (context, position) {
            return ListTile(
              leading: Text(
                productsList[position].productName!,
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
              title: Text(
                '₹${productsList[position].productPrice!.toString()}',
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '₹${productsList[position].stockQuantity!.toString()}',
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
            );
          }),
    );
  }
}
