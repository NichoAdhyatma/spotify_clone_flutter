import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:spotify_clone/features/home/presentation/pages/home_page.dart';
import 'package:spotify_clone/features/splash/cubit/splash_redirect_cubit.dart';
import 'package:spotify_clone/generated/assets.dart';
import 'package:spotify_clone/features/intro/presentation/pages/get_started_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppUserCubit, AppUserState, bool>(
      selector: (state) {
        return state is AppUserAuthenticated;
      },
      builder: (context, isUserAuthenticated) {
        return BlocListener<SplashRedirectCubit, SplashRedirectState>(
          listener: (context, state) {
            if (state is SplashRedirectToGetStarted) {
              isUserAuthenticated
                  ? Navigator.of(context).pushAndRemoveUntil(
                      HomePage.route(),
                      (route) => false,
                    )
                  : Navigator.of(context).pushAndRemoveUntil(
                      GetStartedPage.route(),
                      (route) => false,
                    );
            }
          },
          child: Scaffold(
            body: Center(
              child: SvgPicture.asset(Assets.imagesAppLogo),
            ),
          ),
        );
      },
    );
  }
}
