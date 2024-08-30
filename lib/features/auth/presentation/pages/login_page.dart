import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/common/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_clone/core/common/widgets/app_button.dart';
import 'package:spotify_clone/core/theme/app_pallete.dart';
import 'package:spotify_clone/core/utils/sizedbox_ext.dart';
import 'package:spotify_clone/features/auth/presentation/pages/signup_page.dart';
import 'package:spotify_clone/generated/assets.dart';

class LoginPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          Assets.imagesAppLogo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _loginText(),
              20.heightSB,
              _supportText(),
              35.heightSB,
              const TextField(
                decoration: InputDecoration(
                  hintText: "Enter Email",
                ),
              ),
              20.heightSB,
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              40.heightSB,
              AppButton(
                label: "Login",
                onPressed: () {},
              ),
              20.heightSB,
              _orDivider(),
              20.heightSB,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.vectorsGoogle,
                    width: 30,
                  ),
                  40.widthSB,
                  SvgPicture.asset(
                    Assets.vectorsApple,
                    width: 30,
                  ),
                ],
              ),
              40.heightSB,
              _navigateText(context)
            ],
          ),
        ),
      ),
    );
  }

  Row _navigateText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Not a Member ?",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        4.widthSB,
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              SignupPage.route(),
            );
          },
          child: const Text(
            "Register Now",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Row _orDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        4.widthSB,
        const Text("Or"),
        4.widthSB,
        const Expanded(child: Divider()),
      ],
    );
  }

  Row _supportText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "If you need any support",
          textAlign: TextAlign.center,
        ),
        4.widthSB,
        const Text(
          "Click here",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppPallete.primary,
          ),
        )
      ],
    );
  }

  Text _loginText() {
    return const Text(
      "Login",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
