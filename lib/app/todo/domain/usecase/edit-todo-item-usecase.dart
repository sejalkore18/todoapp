import 'dart:async';
import 'package:clean_architecture_project/app/todo/domain/repository/todo-repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class EditTodoItemUsecase
    extends CompletableUseCase<EditTodoItemUsecaseParams> {
  final TodoRepository _repository;
  EditTodoItemUsecase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController<void> streamController = StreamController();
    try {
      await _repository.editTodoItem(
          itemID: params!.itemID,
          title: params.title,
          description: params.description);
      streamController.close();
    } catch (error) {
      print('error in getting tags : $error :  EditTodoItemUsecase ');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}

class EditTodoItemUsecaseParams {
  final String itemID;
  final String title;
  final String description;

  EditTodoItemUsecaseParams(
      {required this.itemID, required this.title, required this.description});
}

//Idk idhar stream mein void kyu aaya haiiii???
