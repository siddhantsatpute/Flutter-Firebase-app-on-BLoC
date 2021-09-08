import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_app_bloc/Database/ProductsData.dart';
import 'package:firebase_app_bloc/Models/Products.dart';

part 'addproductsscreen_event.dart';
part 'addproductsscreen_state.dart';

class AddproductsscreenBloc
    extends Bloc<AddproductsscreenEvent, AddproductsscreenState> {
  AddproductsscreenBloc() : super(AddProductInitialState());

  @override
  Stream<AddproductsscreenState> mapEventToState(
    AddproductsscreenEvent event,
  ) async* {
    //Initial event
    if (event is AddProductInitialEvent) {
      yield AddProductInitialState();
    }

    //Initiated event
    else if (event is AddProductInitiatedEvent) {
      yield AddProductInitiatedState();
    }

    //In progress event
    else if (event is AddProductInProgressEvent) {
      //Getting Products from event
      Products product = event.product;
      //Adding product into database
      await ProductsData().addProduct(product.toMap());
      //Printing the table
      await ProductsData().printTable();
      yield AddProductInProgressState();
    }

    //Success event
    else if (event is AddProductSuccessEvent) {
      yield AddProductSuccessState();
    }

    //Failure event
    else if (event is AddProductFailureEvent) {
      yield AddProductFailureState();
    }

    //Unknown event
    else {
      yield AddProductUnknownState();
    }
  }
}
