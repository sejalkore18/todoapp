import 'package:clean_architecture_project/core/presentation/state-machine.dart';

class SignInStateMachine extends StateMachine<SignInState, SignInEvent> {
  SignInStateMachine() : super(SignInInitializationState());

  @override
  SignInState getStateOnEvent(SignInEvent event) {
    final eventType = event.runtimeType;
    SignInState newState = getCurrentState();
    switch (eventType) {
    }

    return newState;
  }
}

class SignInState {}

class SignInEvent {}

class SignInInitializationState extends SignInState {}
