import 'dart:async';
import 'package:clean_architecture_project/app/todo/domain/repository/todo-repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddTodoItemUsecase extends CompletableUseCase<AddTodoItemUsecaseParams> {
  final TodoRepository _repository;
  AddTodoItemUsecase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController<void> streamController = StreamController();
    try {
      await _repository.addTodoItem(
          title: params!.title, description: params.description);
      streamController.close();
    } catch (error) {
      print('error in getting tags : error :  AddTodoItemUsecase ');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}

class AddTodoItemUsecaseParams {
  final String title;
  final String description;

  AddTodoItemUsecaseParams({required this.title, required this.description});
}
