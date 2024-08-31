import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/features/auth/domain/entities/user.dart';
import 'package:spotify_clone/features/auth/domain/repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  Future<Either<Failure, UserEntity>> call(SignInParams params) async {
    return await authRepository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
