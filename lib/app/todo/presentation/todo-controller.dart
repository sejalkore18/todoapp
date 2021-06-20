import 'package:clean_architecture_project/app/navigation-service.dart';
import 'package:clean_architecture_project/app/todo/presentation/todo-presenter.dart';
import 'package:clean_architecture_project/app/todo/presentation/todo-state-machine.dart';
import 'package:clean_architecture_project/core/presentation/observer.dart';
import 'package:clean_architecture_project/injection_container.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class TodoController extends Controller {
  final TodoPresenter _presenter;
  final TodoStateMachine _stateMachine = new TodoStateMachine();
  final _navigationService = serviceLocator<NavigationService>();
  TodoController()
      : _presenter = serviceLocator<TodoPresenter>(),
        super();

  @override
  void initListeners() {}

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed();
  }

  TodoState getCurrentState() {
    return _stateMachine.getCurrentState();
  }

  void addTodo({required String title, required String description}) {
    // _navigationService.navigateBack();
    _presenter.todoAddItem(
        new UseCaseObserver(
          () {
            _stateMachine.onEvent(new TodoInitializationEvent());
            refreshUI();
          },
          (error) {
            _stateMachine.onEvent(new TodoErrorEvent());
            refreshUI();
          },
        ),
        title: title,
        description: description);
  }

  void editTodo(
      {required String itemID,
      required String title,
      required String description}) {
    // _navigationService.navigateBack();
    _presenter.todoEditItem(
        new UseCaseObserver(
          () {
            _stateMachine.onEvent(new TodoInitializationEvent());
            refreshUI();
          },
          (error) {
            _stateMachine.onEvent(new TodoErrorEvent());
            refreshUI();
          },
        ),
        itemID: itemID,
        title: title,
        description: description);
  }

  void getTodo() {
    _presenter.todoGetItem(new UseCaseObserver(() {}, (error) {
      _stateMachine.onEvent(new TodoErrorEvent());
      refreshUI();
    }, onNextFunc: (itemList) {
      _stateMachine.onEvent(new TodoInitEvent(itemList: itemList));
      refreshUI();
    }));
  }

  void openAddDialog() {
    _stateMachine.onEvent(new TodoClickEvent());
    refreshUI();
  }

  void openEditDialog(
      {required String itemID,
      required String title,
      required String description}) {
    _stateMachine.onEvent(new TodoLongPressEvent(
        title: title, description: description, itemID: itemID));
    refreshUI();
  }
}
