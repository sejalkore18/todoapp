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
}
