import 'package:clean_architecture_project/core/presentation/state-machine.dart';

class TodoStateMachine extends StateMachine<TodoState, TodoEvent> {
  TodoStateMachine() : super(TodoInitializationState());

  @override
  TodoState getStateOnEvent(TodoEvent event) {
    final eventType = event.runtimeType;
    TodoState newState = getCurrentState();
    switch (eventType) {
      case TodoInitEvent:
        newState = new TodoInitState();
        break;

      case TodoErrorEvent:
        newState = new TodoErrorState();
        break;

      case TodoClickEvent:
        newState = new TodoAddState();
        break;

      case TodoLongPressEvent:
        newState = new TodoEditState();
        break;

      default:
        throw ('Invalid State: TodoStateMachine');
    }
    return newState;
  }
}

class TodoEvent {}

class TodoInitializationEvent extends TodoEvent {}

class TodoInitEvent extends TodoEvent {}

class TodoErrorEvent extends TodoEvent {}

class TodoLongPressEvent extends TodoEvent {}

class TodoClickEvent extends TodoEvent {}

class TodoState {}

class TodoInitializationState extends TodoState {}

class TodoInitState extends TodoState {}

class TodoErrorState extends TodoState {}

class TodoEditState extends TodoState {}

class TodoAddState extends TodoState {}

// Also initialization event kyu aayega??
