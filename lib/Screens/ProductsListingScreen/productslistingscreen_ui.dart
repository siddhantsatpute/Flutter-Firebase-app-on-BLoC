import 'package:firebase_app_bloc/Models/Products.dart';
import 'package:firebase_app_bloc/Screens/ProductsListingScreen/productslistingscreen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListingScreen> {
  late ProductslistingscreenBloc _productslistingscreenBloc;

  @override
  void initState() {
    super.initState();
    _productslistingscreenBloc = ProductslistingscreenBloc();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => _productslistingscreenBloc,
        child: BlocListener(
          listener: (context, state) {
            //Handle the non binded UI widgets here...
          },
          child: BlocBuilder(builder: (context, state) {
            return Container();
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          //Add bloc state to navigate to Add Products Screen
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    ));
  }

  Widget productsList(List<Products> productsList) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, position) {
            return ListTile(
              trailing: Text(
                productsList[position].productName!,
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
            );
          }),
    );
  }
}
