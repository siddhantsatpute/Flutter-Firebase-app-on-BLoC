part of 'loginscreen_bloc.dart';

///This [LoginscreenEvent] class is used to declare the different events which is triggered
///or added into bloc instance of [LoginscreenBloc] from main UI screen.

///Declaration of abstarct class [LoginscreenEvent] extending [Equatable], which is extended
///by all the event classes declared below.
@immutable
abstract class LoginscreenEvent extends Equatable {
  const LoginscreenEvent();
}

//Login Screen Initial Event
class LoginscreenInitialEvent extends LoginscreenEvent {
  const LoginscreenInitialEvent();
  @override
  List<Object?> get props => [];
}

//Login initaiated Event - when user tap on Login button
class LoginScreenLoginInitiatedEvent extends LoginscreenEvent {
  const LoginScreenLoginInitiatedEvent();
  @override
  List<Object?> get props => [];
}

//Login in progress Event - when login data is submitted to server
class LoginScreenLoginInProgressEvent extends LoginscreenEvent {
  final String? userName;
  final String? password;

  const LoginScreenLoginInProgressEvent({this.userName, this.password});
  @override
  List<Object?> get props => [userName, password];
}

//Login completed successfully event - when login is success from server
class LoginScreenLoginSuccessEvent extends LoginscreenEvent {
  const LoginScreenLoginSuccessEvent();
  @override
  List<Object?> get props => [];
}

//Login failed event - when login is failed due to some issue
class LoginScreenLoginFailedEvent extends LoginscreenEvent {
  const LoginScreenLoginFailedEvent();
  @override
  List<Object?> get props => [];
}

//Login to register screen navigation event
class LoginScreenMoveToRegisterScreenEvent extends LoginscreenEvent {
  const LoginScreenMoveToRegisterScreenEvent();

  @override
  List<Object> get props => [];
}

//Login unknown event
class LoginScreenLoginUnknownEvent extends LoginscreenState {
  const LoginScreenLoginUnknownEvent();
  @override
  List<Object?> get props => [];
}
