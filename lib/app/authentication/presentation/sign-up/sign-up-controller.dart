import 'package:clean_architecture_project/app/authentication/presentation/sign-up/sign-up-presenter.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-up/sign-up-state-machine.dart';
import 'package:clean_architecture_project/app/navigation-service.dart';
import 'package:clean_architecture_project/core/presentation/observer.dart';
import 'package:clean_architecture_project/core/presentation/state-machine.dart';
import 'package:clean_architecture_project/injection_container.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignUpController extends Controller {
  final SignUpPresenter _presenter;
  final SignUpStateMachine _stateMachine;
  final NavigationService _navigationService;

  SignUpController()
      : _presenter = serviceLocator<SignUpPresenter>(),
        _stateMachine = new SignUpStateMachine(),
        _navigationService = serviceLocator<NavigationService>(),
        super();

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  @override
  void onInitState();

  @override
  void onDispose() {
    _presenter.dispose();
    super.onDisposed();
  }

  SignUpState getCurrentState() {
    return _stateMachine.getCurrentState();
  }

  void userSignUp({required String email, required String password}) {
    _stateMachine.onEvent(SignUpClickEvent());
    refreshUI();
    _presenter.userSignUpStatus(
        new UseCaseObserver(
          () {
            _navigationService.navigateTo(NavigationService.homePageRoute,
                shouldReplace: true);
          },
          (error) {
            _stateMachine.onEvent(
                new SignUpErrorEvent(email: email, password: password));
            refreshUI();
          },
        ),
        email: email,
        password: password);
  }
}
