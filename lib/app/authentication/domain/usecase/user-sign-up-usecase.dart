import 'dart:async';

import 'package:clean_architecture_project/app/authentication/domain/repository/auth-repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserSignUpUseCase extends CompletableUseCase<UserSignUpUseCaseParams> {
  final AuthRepository _repository;
  UserSignUpUseCase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController<void> streamController = StreamController();
    try {
      await _repository.userSignUp(
          email: params!.email, password: params.password);
      streamController.close();
    } catch (error) {
      print('error in user sign out: $error " UserSignUpUseCase');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}

class UserSignUpUseCaseParams {
  final String email;
  final String password;

  UserSignUpUseCaseParams({required this.email, required this.password});
}
