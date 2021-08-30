part of 'loginscreen_bloc.dart';

///This [LoginscreenState] class is used to declaring the states, which is used as the
///check in main UI screen, and if the condition matches then it will add the event in
///instance of [LoginscreenBloc].

///These states are triggered or 'yield' from the [LoginscreenBloc]


///Declaration of abstract class [LoginscreenState] extending [Equatable], which is
///extended by all the state classes declared below.
@immutable
abstract class LoginscreenState extends Equatable {
  const LoginscreenState();
}

//Login Screen Initial state
class LoginscreenInitialState extends LoginscreenState {
  const LoginscreenInitialState();
  @override
  List<Object?> get props => [];
}

//Login initaiated state - when user tap on Login button
class LoginScreenLoginInitiatedState extends LoginscreenState {
  const LoginScreenLoginInitiatedState();
  @override
  List<Object?> get props => [];
}

//Login in progress state - when login data is submitted to server
class LoginScreenLoginInProgressState extends LoginscreenState {
  const LoginScreenLoginInProgressState();
  @override
  List<Object?> get props => [];
}

//Login completed successfully - when login is success from server
class LoginScreenLoginSuccessState extends LoginscreenState {
  const LoginScreenLoginSuccessState();
  @override
  List<Object?> get props => [];
}

//Login failed - when login is failed due to some issue
class LoginScreenLoginFailedState extends LoginscreenState {
  const LoginScreenLoginFailedState();
  @override
  List<Object?> get props => [];
}

//Login unknown state
class LoginScreenLoginUnknownState extends LoginscreenState {
  const LoginScreenLoginUnknownState();
  @override
  List<Object?> get props => [];
}
