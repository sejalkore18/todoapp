import 'package:clean_architecture_project/core/presentation/state-machine.dart';

class SignUpStateMachine extends StateMachine<SignUpState, SignUpEvent> {
  SignUpStateMachine() : super(SignUpInitState());

  @override
  SignUpState getStateOnEvent(SignUpEvent event) {
    final eventType = event.runtimeType;
    SignUpState newState = getCurrentState();
    switch (eventType) {
      case SignUpClickEvent:
        newState = SignUpLoadingState();
        break;

      case SignUpErrorEvent:
        newState = SignUpErrorState();
        break;

      default:
        throw ('Invalid State: SignUpStateMachine');
    }

    return newState;
  }
}

class SignUpState {}

class SignUpInitState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {}

class SignUpEvent {}

class SignUpClickEvent extends SignUpEvent {}

class SignUpErrorEvent extends SignUpEvent {}
