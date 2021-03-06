import 'package:clean_architecture_project/app/authentication/domain/usecase/user-sign-up-usecase.dart';
import 'package:clean_architecture_project/core/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignUpPresenter extends Presenter {
  final UserSignUpUseCase _userSignUpUseCase;
  SignUpPresenter(this._userSignUpUseCase);

  @override
  dispose() {
    _userSignUpUseCase.dispose();
  }

  void userSignUpStatus(UseCaseObserver observer,
      {required String email, required String password}) {
    _userSignUpUseCase.execute(observer,
        new UserSignUpUseCaseParams(email: email, password: password));
  }
}
