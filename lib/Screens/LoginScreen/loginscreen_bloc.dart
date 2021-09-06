import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_app_bloc/Database/UserData.dart';
import 'package:meta/meta.dart';

part 'loginscreen_event.dart';
part 'loginscreen_state.dart';

///This class [LoginscreenBloc] is responsible to handle the different events and convert
///them into their respective states, declared in [LoginscreenState].

///IMPORTANT NOTE :: POINT TO REMEMBER
///The main purpose of this class is to write the main business logic inside here in each event checks.
///The main building block of BLoC architecture is this class only.

///Whatever operation like API calls or Fetching data from server, updating the UI, handling some
///asynchronous or synchronous operations, or updating the data in SQLite database, all such
///functionalities will be handled from here only.

class LoginscreenBloc extends Bloc<LoginscreenEvent, LoginscreenState> {
  LoginscreenBloc() : super(LoginscreenInitialState());

  ///Below method [mapEventToState] is responsible to map the event to their respective states
  ///If any state is matched with the state as declared in [LoginscreenState], then we use 'yield'
  ///keyword to trigger the particular state, which is respectively handled in [LoginscreenState].

  @override
  Stream<LoginscreenState> mapEventToState(
    LoginscreenEvent event,
  ) async* {
    //Handling login initial event
    if (event is LoginscreenInitialEvent) {
      yield LoginscreenInitialState();
    }

    //Handling login initiated event
    else if (event is LoginScreenLoginInitiatedEvent) {
      yield LoginScreenLoginInitiatedState();
    }

    //Handling login in progress event
    else if (event is LoginScreenLoginInProgressEvent) {
      Map<String, dynamic> user = {
        'name': event.userName,
        'password': event.password
      };

      await UserData().fetchUser(event.userName, event.password);
      await UserData().printTable();

      yield LoginScreenLoginInProgressState();
    }

    //Handling login success event
    else if (event is LoginScreenLoginSuccessEvent) {
      yield LoginScreenLoginSuccessState();
    }

    //Handling login failure event
    else if (event is LoginScreenLoginFailedEvent) {
      yield LoginScreenLoginFailedState();
    }

    //Handling move from login to register screen
    else if (event is LoginScreenMoveToRegisterScreenEvent) {
      yield LoginScreenMoveToRegisterScreenState();
    }

    //Handling if no event is matched
    else {
      yield LoginScreenLoginUnknownState();
    }
  }
}
