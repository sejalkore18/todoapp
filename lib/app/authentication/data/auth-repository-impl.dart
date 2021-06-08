import 'package:clean_architecture_project/app/authentication/domain/repository/auth-repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> userSignIn({required String email, required String password}) {
    // TODO: implement userSignIn
    throw UnimplementedError();
  }

  @override
  Future<void> userSignUp({required String email, required String password}) {
    // TODO: implement userSignUp
    throw UnimplementedError();
  }
}
