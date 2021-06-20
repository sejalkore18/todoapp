import 'dart:async';
import 'package:clean_architecture_project/app/todo/domain/entity/todo-item-entity.dart';
import 'package:clean_architecture_project/app/todo/domain/repository/todo-repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetTodoItemUsecase extends CompletableUseCase<void> {
  final TodoRepository _repository;
  GetTodoItemUsecase(this._repository);

  @override
  Future<Stream<List<TodoItemEntity>>> buildUseCaseStream(params) async {
    final StreamController<List<TodoItemEntity>> streamController =
        StreamController();
    try {
      List<TodoItemEntity> itemList = await _repository.getTodoItems();
      streamController.add(itemList);
      streamController.close();
    } catch (error) {
      print('error in getting tags : $error :  GetTodoItemUsecase ');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}
