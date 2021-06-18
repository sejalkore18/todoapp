import 'package:clean_architecture_project/app/navigation-service.dart';
import 'package:clean_architecture_project/app/todo/presentation/todo-state-machine.dart';
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
    return _stateMachine.getCurrentState()!;
  }

  void addTodo({required String title, required String description}) {
    _stateMachine.onEvent(new TodoClickEvent());
    refreshUI();
    _presenter.userSignUpStatus(
        new UseCaseObserver(
          () {
            _navigationService.navigateTo(NavigationService.homePageRoute,
                shouldReplace: true);
          },
          (error) {
            _stateMachine.onEvent(new TodoErrorEvent());
            refreshUI();
          },
        ),
        title: title,
        description: description);
  }
}
