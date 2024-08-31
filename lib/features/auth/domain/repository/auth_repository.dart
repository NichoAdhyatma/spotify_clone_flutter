import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String name,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  });
}
