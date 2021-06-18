import 'package:clean_architecture_project/core/presentation/state-machine.dart';

class TodoStateMachine extends StateMachine<TodoState, TodoEvent> {
  TodoStateMachine() : super(TodoInitState());

  @override
  TodoState getStateOnEvent(TodoEvent event) {
    final eventType = event.runtimeType;
    TodoState newState = getCurrentState();
    switch (eventType) {
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

class TodoInitEvent extends TodoEvent {}

class TodoErrorEvent extends TodoEvent {}

class TodoLongPressEvent extends TodoEvent {}

class TodoClickEvent extends TodoEvent {}

class TodoState {}

class TodoInitState extends TodoState {}

class TodoErrorState extends TodoState {}

class TodoEditState extends TodoState {}

class TodoAddState extends TodoState {}

//TODO: if the states will take any parameters or not?? How will we knowww and stuff like that..
