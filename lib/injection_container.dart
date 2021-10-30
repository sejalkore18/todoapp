import 'package:clean_architecture_project/app/authentication/data/auth-repository-impl.dart';
import 'package:clean_architecture_project/app/authentication/domain/repository/auth-repository.dart';
import 'package:clean_architecture_project/app/authentication/domain/usecase/user-sign-out-usecase.dart';
import 'package:clean_architecture_project/app/authentication/domain/usecase/user-sign-up-usecase.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-in/sign-in-presenter.dart';
import 'package:clean_architecture_project/app/authentication/presentation/sign-up/sign-up-presenter.dart';
import 'package:clean_architecture_project/app/authentication/presentation/splash-screen/splash-screen-presenter.dart';
import 'package:clean_architecture_project/app/local-database/database/shared.dart';
import 'package:clean_architecture_project/app/navigation-service.dart';
import 'package:clean_architecture_project/app/authentication/domain/usecase/check-user-sign-in-usecase.dart';
import 'package:clean_architecture_project/app/authentication/domain/usecase/user-sign-in-usecase.dart';
import 'package:clean_architecture_project/app/todo/data/todo-repository-impl.dart';
import 'package:clean_architecture_project/app/todo/domain/repository/todo-repository.dart';
import 'package:clean_architecture_project/app/todo/domain/usecase/add-todo-item-usecase.dart';
import 'package:clean_architecture_project/app/todo/domain/usecase/edit-todo-item-usecase.dart';
import 'package:clean_architecture_project/app/todo/domain/usecase/get-todo-items-usecase.dart';
import 'package:clean_architecture_project/app/todo/presentation/todo-presenter.dart';

import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton(() => NavigationService());
  serviceLocator.registerLazySingleton(() => SharedDb());

  // usecase
  // auth
  serviceLocator
      .registerFactory(() => CheckUserSignInUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignInUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignOutUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignUpUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => AddTodoItemUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => EditTodoItemUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => GetTodoItemUsecase(serviceLocator()));

// presenter
  serviceLocator.registerFactory(() => SignInPresenter(serviceLocator()));
  serviceLocator.registerFactory(() => SignUpPresenter(serviceLocator()));
  serviceLocator.registerFactory(() => SplashScreenPresenter(serviceLocator()));
  serviceLocator.registerFactory(() =>
      TodoPresenter(serviceLocator(), serviceLocator(), serviceLocator()));

// repository
  serviceLocator
      .registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  serviceLocator
      .registerLazySingleton<TodoRepository>(() => TodoRespositoryImpl());
}

Future<void> reset() async {
  serviceLocator.resetLazySingleton<AuthRepository>();
  serviceLocator.resetLazySingleton<TodoRepository>();
}
