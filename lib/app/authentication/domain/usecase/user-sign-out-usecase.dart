//HOMEWORKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK :sob

import 'dart:async';

import 'package:clean_architecture_project/app/authentication/domain/repository/auth-repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserSignOutUseCase extends CompletableUseCase<void> {
  final AuthRepository _repository;
  UserSignOutUseCase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController<void> streamController = StreamController();
    try {
      //some logic of mine
      await _repository.signOut();
      print("SignOut successful : SignOutUseCase");
      streamController.close();
    } catch (error) {
      print('error in user sign out : $error : UserSignOutUseCase');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}
