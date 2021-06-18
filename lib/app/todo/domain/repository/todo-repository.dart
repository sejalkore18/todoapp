import 'package:clean_architecture_project/app/todo/domain/entity/todo-item-entity.dart';

abstract class TodoRepository {
  Future<List<TodoItemEntity>> getTodoItems();

  Future<void> addTodoItem(
      {required String title, required String description});

  Future<void> editTodoItem(
      {required String itemID,
      required String title,
      required String description});

  Future<String> getTodoItemID(
      {required String title, required String description});
}
