import 'package:clean_architecture_project/app/authentication/presentation/sign-in/sign-in-presenter.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-in/sign-in-state-machine.dart';
import 'package:clean_architecture_project/app/navigation-service.dart';
import 'package:clean_architecture_project/core/presentation/observer.dart';
import 'package:clean_architecture_project/injection_container.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignInController extends Controller {
  final SignInPresenter _presenter;
  final SignInStateMachine _stateMachine;
  final NavigationService _navigationService;

  SignInController()
      : _presenter = serviceLocator<SignInPresenter>(),
        _stateMachine = new SignInStateMachine(),
        _navigationService = serviceLocator<NavigationService>(),
        super();

  @override
  void initListeners() {
    // TODO: implement initListeners :)
  }

  @override
  void onInitState();

  @override
  void onDispose() {
    _presenter.dispose();
    super.onDisposed();
  }

  SignInState getCurrentState() {
    return _stateMachine.getCurrentState();
  }

  void userSignIn({required String email, required String password}) {
    _stateMachine.onEvent(new SignInClickEvent());
    refreshUI();
    _presenter.userSignInStatus(
      new UseCaseObserver(
        () {
          _navigationService.navigateTo(NavigationService.homePageRoute,
              shouldReplace: true);
        },
        (error) {
          //New State = Error State
          _stateMachine.onEvent(new SignInErrorEvent());
          refreshUI();
        },
      ),
      email: email,
      password: password,
    );
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(NavigationService.signUpPageRoute,
        shouldReplace: false);
  }
}
