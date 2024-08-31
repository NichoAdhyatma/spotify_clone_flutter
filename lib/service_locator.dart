import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_clone/features/auth/domain/usecases/signup_usecase.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_bloc.dart';

import 'core/common/cubits/app_user/app_user_cubit.dart';
import 'features/auth/data/datasources/auth_firebase_service.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/signin_usecase.dart';
import 'firebase_options.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  sl.registerLazySingleton(
      () => AppUserCubit(firebaseAuth: FirebaseAuth.instance));

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
        appUserCubit: sl(),
      ),
    );
}
