import 'package:clean_architecture_project/app/todo/domain/usecase/add-todo-item-usecase.dart';
import 'package:clean_architecture_project/app/todo/domain/usecase/edit-todo-item-usecase.dart';
import 'package:clean_architecture_project/core/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class TodoPresenter extends Presenter {
  final AddTodoItemUsecase _addTodoItemUsecase;
  final EditTodoItemUsecase _editTodoItemUsecase;
  TodoPresenter(this._addTodoItemUsecase, this._editTodoItemUsecase);

  @override
  dispose() {
    _addTodoItemUsecase.dispose();
    _editTodoItemUsecase.dispose(); //I think the functions should be different
  }

  void todoAddStatus(UseCaseObserver observer,
      {required String title, required String description}) {
    _addTodoItemUsecase.execute(observer,
        new AddTodoItemUsecase(title: title, description: description));
  }

  void todoEditStatus(UseCaseObserver observer,
      {required String title, required String description}) {
    _editTodoItemUsecase.execute(observer,
        new AddTodoItemUsecase(title: title, description: description));
  }
}
