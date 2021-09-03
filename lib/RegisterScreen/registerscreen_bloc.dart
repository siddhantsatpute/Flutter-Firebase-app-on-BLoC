import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registerscreen_event.dart';
part 'registerscreen_state.dart';

class RegisterScreenBloc
    extends Bloc<RegisterscreenEvent, RegisterscreenState> {
  RegisterScreenBloc() : super(RegistrationInitialState());

  @override
  Stream<RegisterscreenState> mapEventToState(
    RegisterscreenEvent event,
  ) async* {
    //Initial event
    if (event is RegistrationInitialEvent) {
      yield RegistrationInitialState();
    }

    //Iniated event
    else if (event is RegistrationInitiatedEvent) {
      yield RegistrationInitiatedState();
    }

    //In progress state
    else if (event is RegistrationInProgressEvent) {
      yield RegistrationInProgressState();
    }

    //Success event
    else if (event is RegistrationSuccessEvent) {
      yield RegistrationSuccessState();
    }

    //Failed event
    else if (event is RegistrationFailedEvent) {
      yield RegistrationFailedState();
    }

    //Validation success event
    else if (event is RegistrationValidationSuccessEvent) {
      yield RegistrationValidationSuccessState();
    }

    //Validation failed state
    else if (event is RegistrationValidationFailedEvent) {
      yield RegistrationValidationFailedState();
    }

    //Unknown state event
    else {
      yield RegistrationUnknownState();
    }
  }
}
