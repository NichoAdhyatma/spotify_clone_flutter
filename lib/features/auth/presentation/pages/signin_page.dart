import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/common/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_clone/core/common/widgets/app_button.dart';
import 'package:spotify_clone/core/common/widgets/loader/app_loader.dart';
import 'package:spotify_clone/core/theme/app_pallete.dart';
import 'package:spotify_clone/core/utils/show_snackbar.dart';
import 'package:spotify_clone/core/utils/sizedbox_ext.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:spotify_clone/features/auth/presentation/pages/signup_page.dart';
import 'package:spotify_clone/features/auth/presentation/widgets/auth_field.dart';
import 'package:spotify_clone/features/root/presentation/root_page.dart';
import 'package:spotify_clone/generated/assets.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignInPage(),
      );

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
              buildSignInForm(),
              40.heightSB,
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthErrorState) {
                    showSnackbar(context, state.message);
                  } else if (state is AuthSuccessState) {
                    Navigator.of(context).pushReplacement(
                      RootPage.route(),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const AppLoader();
                  }
                  return _signInButton(context);
                },
              ),
              20.heightSB,
              _orDivider(),
              20.heightSB,
              _socialAuthButton(),
              40.heightSB,
              _navigateText(context)
            ],
          ),
        ),
      ),
    );
  }

  Row _socialAuthButton() {
    return Row(
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
    );
  }

  AppButton _signInButton(BuildContext context) {
    return AppButton(
      label: "Login",
      onPressed: () {
        if (formKey.currentState!.validate()) {
          context.read<AuthBloc>().add(
                AuthSignInEvent(
                  email: _emailController.text,
                  password: _passwordController.text,
                ),
              );
        }
      },
    );
  }

  Form buildSignInForm() {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          AuthField(
            controller: _emailController,
            hintText: "Enter Email",
          ),
          20.heightSB,
          AuthField(
            controller: _passwordController,
            obscureText: true,
            hintText: "Password",
          ),
        ],
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
