import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/common/entities/user_entitiy.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/auth/domain/repository/auth_repository.dart';

class SignInUseCase implements UseCase<UserEntity, SignInParams> {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(params) async {
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
