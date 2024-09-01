import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/common/widgets/app_button.dart';
import 'package:spotify_clone/core/theme/app_pallete.dart';
import 'package:spotify_clone/core/utils/sizedbox_ext.dart';
import 'package:spotify_clone/features/auth/presentation/pages/signup_or_signin_page.dart';
import 'package:spotify_clone/core/common/cubits/theme/theme_cubit.dart';
import 'package:spotify_clone/features/intro/presentation/widgets/circle_blur_button.dart';
import 'package:spotify_clone/features/intro/presentation/widgets/intro_layout.dart';
import 'package:spotify_clone/generated/assets.dart';

class ChooseModePage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const ChooseModePage(),
      );

  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroLayout(
        image: Assets.imagesGetStartedBg2,
        child: Column(
          children: [
            SvgPicture.asset(Assets.imagesAppLogo),
            const Spacer(),
            const Text(
              'Choose Mode',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            20.heightSB,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleBlurButton(
                      onPressed: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                      image: Assets.vectorsMoon,
                    ),
                    10.heightSB,
                    const Text(
                      'Dark Mode',
                      style: TextStyle(
                        color: AppPallete.textWhite2,
                      ),
                    ),
                  ],
                ),
                40.widthSB,
                Column(
                  children: [
                    CircleBlurButton(
                      onPressed: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                      },
                      image: Assets.vectorsSun,
                    ),
                    10.heightSB,
                    const Text(
                      'Light Mode',
                      style: TextStyle(
                        color: AppPallete.textWhite2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            60.heightSB,
            AppButton(
              onPressed: () {
                Navigator.of(context).push(
                  SignupOrSigninPage.route(),
                );
              },
              label: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
