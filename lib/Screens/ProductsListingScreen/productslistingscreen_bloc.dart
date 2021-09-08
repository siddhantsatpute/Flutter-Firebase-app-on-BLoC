import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_app_bloc/Database/ProductsData.dart';
import 'package:firebase_app_bloc/Models/Products.dart';

part 'productslistingscreen_event.dart';
part 'productslistingscreen_state.dart';

class ProductslistingscreenBloc
    extends Bloc<ProductslistingscreenEvent, ProductslistingscreenState> {
  ProductslistingscreenBloc() : super(ProductsListingInitialState());

  @override
  Stream<ProductslistingscreenState> mapEventToState(
    ProductslistingscreenEvent event,
  ) async* {
    //Product listing initial event
    if (event is ProductsListingInitialEvent) {
      yield ProductsListingInitialState();
    }

    //Product listing loading event
    else if (event is ProductsListingLoadingEvent) {
      yield ProductsListingLoadingState();

      ProductsData productsData = ProductsData();
      List<Products> products = await productsData.getAllProducts();

      yield ProductsListingLoadSuccessState(products);
    }

    /*  //Product listing load success event
    else if (event is ProductsListingLoadSuccessEvent) {
      yield ProductsListingLoadSuccessState();
    } */

    //Product listing load failed event
    else if (event is ProductsListingLoadFailedEvent) {
      yield ProductsListingLoadFailedState();
    }

    //Product listing move to AddProductsScreen Event
    else if (event is ProductsListingMoveToAddproductsEvent) {
      yield ProductsListingMoveToAddproductsState();
    }

    //Product listing load unknown event
    else if (event is ProductsListingLoadUnknownEvent) {
      yield ProductsListingLoadUnknownState();
    }
  }
}
