import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/common/entities/user_entitiy.dart';
import 'package:spotify_clone/core/error/failure.dart';

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
