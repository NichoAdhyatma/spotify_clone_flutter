import 'package:get_it/get_it.dart';
import 'package:spotify_clone/features/auth/domain/usecases/signup_usecase.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_bloc.dart';

import 'features/auth/data/datasources/auth_firebase_service.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/signin_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  _initAuthFeature();
}

void _initAuthFeature() {
  sl
    ..registerFactory<AuthFirebaseService>(
      () => AuthFirebaseServiceImpl(),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        authFirebaseService: sl(),
      ),
    )
    ..registerFactory(
      () => SignUpUseCase(
        authRepository: sl(),
      ),
    )
    ..registerFactory(
      () => SignInUseCase(
        authRepository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        signUpUseCase: sl(),
        signInUseCase: sl(),
      ),
    );
}
