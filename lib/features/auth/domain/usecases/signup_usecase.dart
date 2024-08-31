import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/features/auth/domain/entities/user.dart';
import 'package:spotify_clone/features/auth/domain/repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await authRepository.signUp(
      email: params.email,
      name: params.name,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String email;
  final String name;
  final String password;

  SignUpParams({
    required this.email,
    required this.name,
    required this.password,
  });
}
