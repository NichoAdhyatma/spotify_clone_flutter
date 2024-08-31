import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:spotify_clone/core/theme/app_theme.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:spotify_clone/features/root/presentation/root_page.dart';
import 'package:spotify_clone/features/splash/presentation/pages/splash_page.dart';
import 'package:spotify_clone/service_locator.dart';

import 'features/intro/presentation/cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => sl<AppUserCubit>()..isUserAuth(),
        ),
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Spotify Clone',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state,
            debugShowCheckedModeBanner: false,
            home: BlocSelector<AppUserCubit, AppUserState, bool>(
              selector: (state) {
                return state is AppUserAuthenticated;
              },
              builder: (context, isUserAuthenticated) {
                return isUserAuthenticated
                    ? const RootPage()
                    : const SplashPage();
              },
            ),
          );
        },
      ),
    );
  }
}
