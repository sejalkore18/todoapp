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
        newState = SignInErrorState();
        break;

      default:
        throw ('Invalid State: SignInStateMachine');
    }

    return newState;
  }
}

class SignInState {}

class SignInEvent {}

class SignInInitState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {}

class SignInClickEvent extends SignInEvent {}

class SignInErrorEvent extends SignInEvent {}
