import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/common/entities/user_entitiy.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/auth/domain/repository/auth_repository.dart';

class SignUpUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  @override
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
