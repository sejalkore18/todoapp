import 'package:clean_architecture_project/app/authentication/domain/usecase/user-sign-in-usecase.dart';
import 'package:clean_architecture_project/core/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignInPresenter extends Presenter {
  final UserSignInUseCase _userSignInUseCase;
  SignInPresenter(this._userSignInUseCase);

  @override
  dispose() {
    _userSignInUseCase.dispose();
  }

  void userSignInStatus(UseCaseObserver observer,
      {required String email, required String password}) {
    _userSignInUseCase.execute(observer,
        new UserSignInUseCaseParams(email: email, password: password));
  }
}
