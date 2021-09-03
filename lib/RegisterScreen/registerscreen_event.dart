part of 'registerscreen_bloc.dart';

abstract class RegisterscreenEvent extends Equatable {
  const RegisterscreenEvent();

  @override
  List<Object> get props => [];
}

//Register Screen initial Event
class RegistrationInitialEvent extends RegisterscreenEvent {
  const RegistrationInitialEvent();

  @override
  List<Object> get props => [];
}

//Registration initiated Event
class RegistrationInitiatedEvent extends RegisterscreenEvent {
  const RegistrationInitiatedEvent();

  @override
  List<Object> get props => [];
}

//Registration in progress Event
class RegistrationInProgressEvent extends RegisterscreenEvent {
  const RegistrationInProgressEvent();

  @override
  List<Object> get props => [];
}

//Registration success Event
class RegistrationSuccessEvent extends RegisterscreenEvent {
  const RegistrationSuccessEvent();

  @override
  List<Object> get props => [];
}

//Registration failed Event
class RegistrationFailedEvent extends RegisterscreenEvent {
  const RegistrationFailedEvent();

  @override
  List<Object> get props => [];
}

//Registration fields validation success Event
class RegistrationValidationSuccessEvent extends RegisterscreenEvent {
  const RegistrationValidationSuccessEvent();

  @override
  List<Object> get props => [];
}

//Registration fields validation failed Event
class RegistrationValidationFailedEvent extends RegisterscreenEvent {
  const RegistrationValidationFailedEvent();

  @override
  List<Object> get props => [];
}

//Registration unknown Event
class RegistrationUnknownEvent extends RegisterscreenEvent {
  const RegistrationUnknownEvent();

  @override
  List<Object> get props => [];
}
