import 'package:clean_architecture_project/core/presentation/state-machine.dart';

class SplashScreenStateMachine
    extends StateMachine<SplashScreenState, SplashScreenEvent> {
  SplashScreenStateMachine() : super(SplashScreenInitializationState());

  @override
  SplashScreenState getStateOnEvent(SplashScreenEvent event) {
    final eventType = event.runtimeType;
    SplashScreenState newState = getCurrentState();
    switch (eventType) {
    }

    return newState;
  }
}

class SplashScreenState {}

class SplashScreenEvent {}

class SplashScreenInitializationState extends SplashScreenState {}
