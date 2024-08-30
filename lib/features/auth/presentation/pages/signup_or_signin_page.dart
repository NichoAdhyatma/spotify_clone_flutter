import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/common/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_clone/core/common/widgets/app_button.dart';
import 'package:spotify_clone/core/theme/app_pallete.dart';
import 'package:spotify_clone/core/utils/sizedbox_ext.dart';
import 'package:spotify_clone/features/auth/presentation/pages/signup_page.dart';
import 'package:spotify_clone/generated/assets.dart';

import 'login_page.dart';

class SignupOrSigninPage extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (_) => const SignupOrSigninPage());

  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(Assets.vectorsPatternAuthTop),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(Assets.vectorsPatternAuthBottom),
          ),
          Transform.translate(
            offset: const Offset(-10, 0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(Assets.imagesAuthImageBottom),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.imagesAppLogo),
                40.heightSB,
                const Text(
                  "Enjoy Listening Music",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                20.heightSB,
                const Text(
                  "Spotify is a proprietary Swedish audio streaming and media"
                  " services provider ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppPallete.textGrey,
                  ),
                ),
                40.heightSB,
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        onPressed: () {
                          Navigator.of(context).push(SignupPage.route());
                        },
                        label: "Register",
                      ),
                    ),
                    20.widthSB,
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(LoginPage.route());
                        },
                        child: Text(
                          "Login",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
