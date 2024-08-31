import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/core/error/exception.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_request.dart';
import 'package:spotify_clone/features/auth/data/models/user_model.dart';

abstract class AuthFirebaseService {
  Future<UserModel> signUp(CreateUserRequest user);

  Future<UserModel> signIn({required String email, required String password});
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<UserModel> signUp(CreateUserRequest user) async {
    try {
      print("User: $user");

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      if (credential.user == null) {
        throw const ServerException("User is null!");
      }

      await credential.user?.updateDisplayName(user.name);

      return UserModel(
        id: credential.user?.uid ?? "",
        email: credential.user?.email ?? "",
        name: credential.user?.displayName ?? "",
      );
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? "An error occurred");
    }
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw const ServerException("User is null!");
      }

      return UserModel(
        id: credential.user?.uid ?? "",
        email: credential.user?.email ?? "",
        name: credential.user?.displayName ?? "",
      );
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? "An error occurred");
    }
  }
}
