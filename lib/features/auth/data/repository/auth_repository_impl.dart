import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/common/entities/user_entitiy.dart';
import 'package:spotify_clone/core/error/exception.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/features/auth/data/datasources/auth_firebase_service.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_request.dart';
import 'package:spotify_clone/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseService authFirebaseService;

  AuthRepositoryImpl({required this.authFirebaseService});

  Future<Either<Failure, UserEntity>> _getUser(
    Future<UserEntity> Function() fn,
  ) async {
    try {
      final user = await fn();

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message ?? "An error occurred"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () => authFirebaseService.signIn(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    return _getUser(
      () => authFirebaseService.signUp(
        CreateUserRequest(
          email: email,
          name: name,
          password: password,
        ),
      ),
    );
  }
}
