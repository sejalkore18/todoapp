import 'package:clean_architecture_project/app/todo/domain/entity/todo-item-entity.dart';

abstract class TodoRepository {
  Future<Stream<TodoItemEntity>> getTodoItems({required String userID});
  Future<void> addTodoItem(
      {required String userID,
      required String title,
      required String description});

  Future<void> editTodoItem(
      {required String userID,
      required String itemID,
      required String title,
      required String description});
}
