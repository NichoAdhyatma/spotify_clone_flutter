import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/generated/assets.dart';

class SignupOrSigninPage extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (_) => const SignupOrSigninPage());

  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(Assets.vectorsPatternAuthTop),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(Assets.vectorsPatternAuthBottom),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(Assets.imagesAuthImageBottom),
          ),
        ],
      ),
    );
  }
}
