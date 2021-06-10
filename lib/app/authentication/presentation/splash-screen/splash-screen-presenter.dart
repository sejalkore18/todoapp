import 'package:clean_architecture_project/app/authentication/domain/usecase/check-user-sign-in-usecase.dart';
import 'package:clean_architecture_project/core/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashScreenPresenter extends Presenter {
  final CheckUserSignInUsecase _checkUserSignInUsecase;
  SplashScreenPresenter(this._checkUserSignInUsecase);

  @override
  dispose() {
    _checkUserSignInUsecase.dispose();
  }

  void checkUserSignInStatus(UseCaseObserver observer) {
    _checkUserSignInUsecase.execute(observer);
  }
}
