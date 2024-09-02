import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_clone/features/auth/domain/usecases/signup_usecase.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:spotify_clone/features/home/domain/usecases/get_playlist_songs_usecase.dart';
import 'package:spotify_clone/features/home/presentation/bloc/news_cubit/news_cubit.dart';
import 'package:spotify_clone/features/home/presentation/bloc/playlist_songs_cubit/playlist_cubit.dart';

import 'core/common/cubits/app_user/app_user_cubit.dart';
import 'features/auth/data/datasources/auth_firebase_service.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/signin_usecase.dart';
import 'features/home/data/datasources/song_remote_datasource.dart';
import 'features/home/data/repository/song_repository_impl.dart';
import 'features/home/domain/repository/song_repository.dart';
import 'features/home/domain/usecases/get_news_songs_usecase.dart';
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

  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  sl.registerLazySingleton(() => FirebaseAuth.instance);

  sl.registerLazySingleton(
    () => AppUserCubit(
      firebaseAuth: sl(),
    ),
  );

  _initAuthFeature();

  _initHomeFeature();
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

void _initHomeFeature() {
  sl
    ..registerFactory<SongRemoteDatasource>(
      () => SongRemoteDatasourceImpl(
        firestore: sl(),
      ),
    )
    ..registerFactory<SongRepository>(
      () => SongRepositoryImpl(
        remoteDataSource: sl(),
      ),
    )
    ..registerFactory(
      () => GetNewsSongsUseCase(
        songRepository: sl(),
      ),
    )
    ..registerFactory(
      () => GetPlaylistSongsUseCase(
        songRepository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => NewsCubit(
        getSongsUseCase: sl(),
      ),
    )
    ..registerLazySingleton(
      () => PlaylistCubit(
        getPlaylistSongsUseCase: sl(),
      ),
    );
}
