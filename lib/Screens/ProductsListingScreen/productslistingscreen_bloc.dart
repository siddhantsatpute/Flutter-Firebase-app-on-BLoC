import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'productslistingscreen_event.dart';
part 'productslistingscreen_state.dart';

class ProductslistingscreenBloc extends Bloc<ProductslistingscreenEvent, ProductslistingscreenState> {
  ProductslistingscreenBloc() : super(ProductslistingscreenInitial());

  @override
  Stream<ProductslistingscreenState> mapEventToState(
    ProductslistingscreenEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
