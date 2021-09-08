part of 'productslistingscreen_bloc.dart';

abstract class ProductslistingscreenEvent extends Equatable {
  const ProductslistingscreenEvent();

  @override
  List<Object> get props => [];
}

//Product listing initial Event
class ProductsListingInitialEvent extends ProductslistingscreenEvent {
  const ProductsListingInitialEvent();

  @override
  List<Object> get props => [];
}

//Product listing loading Event
class ProductsListingLoadingEvent extends ProductslistingscreenEvent {
  const ProductsListingLoadingEvent();

  @override
  List<Object> get props => [];
}

//Product listing load complete Event
class ProductsListingLoadSuccessEvent extends ProductslistingscreenEvent {
  const ProductsListingLoadSuccessEvent();

  @override
  List<Object> get props => [];
}

//Product listing load failed Event
class ProductsListingLoadFailedEvent extends ProductslistingscreenEvent {
  const ProductsListingLoadFailedEvent();

  @override
  List<Object> get props => [];
}

//Product listing move to AddProductsScreen Event
class ProductsListingMoveToAddproductsEvent extends ProductslistingscreenEvent {
  const ProductsListingMoveToAddproductsEvent();

  @override
  List<Object> get props => [];
}

//Product listing load unknown Event
class ProductsListingLoadUnknownEvent extends ProductslistingscreenEvent {
  const ProductsListingLoadUnknownEvent();

  @override
  List<Object> get props => [];
}
