import 'package:clean_architecture_project/app/todo/domain/usecase/add-todo-item-usecase.dart';
import 'package:clean_architecture_project/app/todo/domain/usecase/edit-todo-item-usecase.dart';
import 'package:clean_architecture_project/app/todo/domain/usecase/get-todo-items-usecase.dart';
import 'package:clean_architecture_project/core/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class TodoPresenter extends Presenter {
  final AddTodoItemUsecase _addTodoItemUsecase;
  final EditTodoItemUsecase _editTodoItemUsecase;
  final GetTodoItemUsecase _getTodoItemUsecase;
  TodoPresenter(this._addTodoItemUsecase, this._editTodoItemUsecase,
      this._getTodoItemUsecase);

  @override
  dispose() {
    _addTodoItemUsecase.dispose();
    _editTodoItemUsecase.dispose();
    _getTodoItemUsecase.dispose(); //I think the functions should be separated;
  }

  void todoAddItem(UseCaseObserver observer,
      {required String title, required String description}) {
    _addTodoItemUsecase.execute(observer,
        new AddTodoItemUsecaseParams(title: title, description: description));
  }

  void todoEditItem(UseCaseObserver observer,
      {required String title, required String description}) {
    _editTodoItemUsecase.execute(observer,
        new EditTodoItemUsecaseParams(title: title, description: description));
  }

  void todoGetItem(UseCaseObserver observer) {
    _getTodoItemUsecase.execute(observer);
  }
}
