part of 'productslistingscreen_bloc.dart';

abstract class ProductslistingscreenState extends Equatable {
  const ProductslistingscreenState();

  @override
  List<Object> get props => [];
}

//Product listing initial state
class ProductsListingInitialState extends ProductslistingscreenState {
  const ProductsListingInitialState();

  @override
  List<Object> get props => [];
}

//Product listing loading state
class ProductsListingLoadingState extends ProductslistingscreenState {
  const ProductsListingLoadingState();

  @override
  List<Object> get props => [];
}

//Product listing load complete state
class ProductsListingLoadSuccessState extends ProductslistingscreenState {
  final List<Products> products;

  const ProductsListingLoadSuccessState(this.products);

  @override
  List<Object> get props => [products];
}

//Product listing load failed state
class ProductsListingLoadFailedState extends ProductslistingscreenState {
  const ProductsListingLoadFailedState();

  @override
  List<Object> get props => [];
}

//Product listing move to AddProductsScreen Event
class ProductsListingMoveToAddproductsState extends ProductslistingscreenState {
  const ProductsListingMoveToAddproductsState();

  @override
  List<Object> get props => [];
}

//Product listing load unknown state
class ProductsListingLoadUnknownState extends ProductslistingscreenState {
  const ProductsListingLoadUnknownState();

  @override
  List<Object> get props => [];
}
