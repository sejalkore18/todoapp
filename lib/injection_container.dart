import 'package:clean_architecture_project/app/navigation-service.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  serviceLocator.registerLazySingleton(() => NavigationService());
}

Future<void> reset() async {}
