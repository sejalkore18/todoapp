import 'package:clean_architecture_project/core/presentation/state-machine.dart';

class SignInStateMachine extends StateMachine<SignInState, SignInEvent> {
  SignInStateMachine() : super(SignInInitState());

  @override
  SignInState getStateOnEvent(SignInEvent event) {
    final eventType = event.runtimeType;
    SignInState newState = getCurrentState();
    switch (eventType) {
      case SignInClickEvent:
        newState = SignInLoadingState();
        break;

      case SignInErrorEvent:
        SignInErrorEvent errorEvent = event as SignInErrorEvent;
        newState = SignInErrorState(
            email: errorEvent.email, password: errorEvent.password);
        break;

      default:
        throw ('Invalid State: SignInStateMachine');
    }

    return newState;
  }
}

class SignInState {}

class SignInInitState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  final String email;
  final String password;

  SignInErrorState({required this.email, required this.password});
}

class SignInEvent {}

class SignInClickEvent extends SignInEvent {}

class SignInErrorEvent extends SignInEvent {
  final String email;
  final String password;

  SignInErrorEvent({required this.email, required this.password});
}
