import 'package:clean_architecture_project/app/authentication/data/auth-repository-impl.dart';
import 'package:clean_architecture_project/app/authentication/domain/repository/auth-repository.dart';
import 'package:clean_architecture_project/app/authentication/domain/usecase/user-sign-out-usecase.dart';
import 'package:clean_architecture_project/app/authentication/domain/usecase/user-sign-up-usecase.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-in/sign-in-presenter.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-up/sign-up-presenter.dart';
import 'package:clean_architecture_project/app/authentication/presentation/splash-screen/splash-screen-presenter.dart';
import 'package:clean_architecture_project/app/navigation-service.dart';
import 'package:clean_architecture_project/app/authentication/domain/usecase/check-user-sign-in-usecase.dart';
import 'package:clean_architecture_project/app/authentication/domain/usecase/user-sign-in-usecase.dart';

import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  serviceLocator.registerLazySingleton(() => NavigationService());
  // usecase
  // auth
  serviceLocator
      .registerFactory(() => CheckUserSignInUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignInUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignOutUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignUpUseCase(serviceLocator()));

// presenter
  serviceLocator.registerFactory(() => SignInPresenter(serviceLocator()));
  serviceLocator.registerFactory(() => SignUpPresenter(serviceLocator()));
  serviceLocator.registerFactory(() => SplashScreenPresenter(serviceLocator()));

// repository
  serviceLocator
      .registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}

Future<void> reset() async {
  serviceLocator.resetLazySingleton<AuthRepository>();
}
