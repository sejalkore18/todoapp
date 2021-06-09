import 'package:clean_architecture_project/core/presentation/state-machine.dart';

class SignUpStateMachine extends StateMachine<SignUpState, SignUpEvent> {
  SignUpStateMachine() : super(SignUpInitializationState());

  @override
  SignUpState getStateOnEvent(SignUpEvent event) {
    final eventType = event.runtimeType;
    SignUpState newState = getCurrentState();
    switch (eventType) {
    }

    return newState;
  }
}

class SignUpState {}

class SignUpEvent {}

class SignUpInitializationState extends SignUpState {}
