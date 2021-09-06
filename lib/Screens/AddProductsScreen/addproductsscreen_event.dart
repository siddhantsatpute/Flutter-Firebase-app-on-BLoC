part of 'addproductsscreen_bloc.dart';

abstract class AddproductsscreenEvent extends Equatable {
  const AddproductsscreenEvent();

  @override
  List<Object> get props => [];
}

//Initial event
class AddProductInitialEvent extends AddproductsscreenEvent {
  const AddProductInitialEvent();

  @override
  List<Object> get props => [];
}

//Add product initiated event
class AddProductInitiatedEvent extends AddproductsscreenEvent {
  const AddProductInitiatedEvent();

  @override
  List<Object> get props => [];
}

//Add product in progress event
class AddProductInProgressEvent extends AddproductsscreenEvent {
  final Products product;

  const AddProductInProgressEvent({required this.product});

  @override
  List<Object> get props => [product];
}

//Add product success event
class AddProductSuccessEvent extends AddproductsscreenEvent {
  const AddProductSuccessEvent();

  @override
  List<Object> get props => [];
}

//Add product failure event
class AddProductFailureEvent extends AddproductsscreenEvent {
  const AddProductFailureEvent();

  @override
  List<Object> get props => [];
}

//Add product unknown event
class AddProductUnknownEvent extends AddproductsscreenEvent {
  const AddProductUnknownEvent();

  @override
  List<Object> get props => [];
}
