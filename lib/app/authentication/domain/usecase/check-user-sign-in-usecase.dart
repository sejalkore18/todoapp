import 'dart:async';

import 'package:clean_architecture_project/app/authentication/domain/repository/auth-repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class CheckUserSignInUsecase extends CompletableUseCase<void> {
  final AuthRepository _repository;
  CheckUserSignInUsecase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController<void> streamController = StreamController();
    try {
      bool loginStatus = _repository.checkUserSignInStatus();
      streamController.add(loginStatus);
      streamController.close();
    } catch (error) {
      print("Error in getting sign in Status : $error :CheckUserSignInUseCase");
      streamController.addError(error);
    }
    return streamController.stream;
  }
}
