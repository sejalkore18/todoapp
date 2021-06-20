import 'package:clean_architecture_project/app/todo/domain/entity/todo-item-entity.dart';
import 'package:clean_architecture_project/core/presentation/state-machine.dart';

class TodoStateMachine extends StateMachine<TodoState, TodoEvent> {
  TodoStateMachine() : super(TodoInitializationState());

  @override
  TodoState getStateOnEvent(TodoEvent event) {
    final eventType = event.runtimeType;
    TodoState newState = getCurrentState();
    switch (eventType) {
      case TodoInitializationEvent:
        newState = new TodoInitializationState();
        break;

      case TodoInitEvent:
        TodoInitEvent todoInitEvent = event as TodoInitEvent;
        newState = new TodoInitState(itemList: todoInitEvent.itemList);
        break;

      case TodoErrorEvent:
        newState = new TodoErrorState();
        break;

      case TodoClickEvent:
        newState = new TodoAddState();
        break;

      case TodoLongPressEvent:
        TodoLongPressEvent todoLongPressEvent = event as TodoLongPressEvent;
        newState = new TodoEditState(
            title: todoLongPressEvent.title,
            description: todoLongPressEvent.description);
        break;

      default:
        throw ('Invalid State: TodoStateMachine');
    }
    return newState;
  }
}

class TodoEvent {}

class TodoInitializationEvent extends TodoEvent {}

class TodoInitEvent extends TodoEvent {
  final List<TodoItemEntity> itemList;
  TodoInitEvent({required this.itemList});
}

class TodoErrorEvent extends TodoEvent {}

class TodoLongPressEvent extends TodoEvent {
  final String title;
  final String description;

  TodoLongPressEvent({required this.title, required this.description});
}

class TodoClickEvent extends TodoEvent {}

class TodoState {}

class TodoInitializationState extends TodoState {}

class TodoInitState extends TodoState {
  final List<TodoItemEntity> itemList;
  TodoInitState({required this.itemList});
}

class TodoErrorState extends TodoState {}

class TodoEditState extends TodoState {
  final String title;
  final String description;

  TodoEditState({required this.title, required this.description});
}

class TodoAddState extends TodoState {}
