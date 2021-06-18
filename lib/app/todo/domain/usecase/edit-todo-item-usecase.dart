import 'dart:async';
import 'package:clean_architecture_project/app/todo/domain/repository/todo-repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class EditTodoItemUsecase extends CompletableUseCase<void> {
  final TodoRepository _repository;
  EditTodoItemUsecase(this._repository);

  @override
  Future<Stream<streamType>> buildUseCaseStream(params) async {
    final StreamController<streamType> streamController = StreamController();
    try {
      streamController.close();
    } catch (error) {
      print('error in getting tags : error :  EditTodoItemUsecase ');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}
