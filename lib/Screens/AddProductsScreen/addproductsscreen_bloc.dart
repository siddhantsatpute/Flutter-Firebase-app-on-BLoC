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
    if (event is AddProductInitialEvent) {
      yield AddProductInitialState();
    } else if (event is AddProductInitiatedEvent) {
      yield AddProductInitiatedState();
    } else if (event is AddProductInProgressEvent) {
      Products product = event.product;
      await ProductsData().addProduct(product.toMap());
      await ProductsData().printTable();
      yield AddProductInProgressState();
    } else if (event is AddProductSuccessEvent) {
      yield AddProductSuccessState();
    } else if (event is AddProductFailureEvent) {
      yield AddProductFailureState();
    } else {
      yield AddProductUnknownState();
    }
  }
}
