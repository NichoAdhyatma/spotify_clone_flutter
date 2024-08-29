import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/common/widgets/app_button.dart';
import 'package:spotify_clone/core/theme/app_pallete.dart';
import 'package:spotify_clone/core/utils/sizedbox_ext.dart';
import 'package:spotify_clone/features/intro/presentation/pages/choose_mode_page.dart';
import 'package:spotify_clone/features/intro/presentation/widgets/intro_layout.dart';
import 'package:spotify_clone/generated/assets.dart';

class GetStartedPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const GetStartedPage(),
      );

  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroLayout(
        image: Assets.imagesGetStartedBg1,
        child: Column(
          children: [
            SvgPicture.asset(Assets.imagesAppLogo),
            const Spacer(),
            const Text(
              'Enjoy listening to music',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            20.heightSB,
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
              ' Sagittis enim purus sed phasellus. Cursus ornare id'
              ' scelerisque aliquam.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppPallete.textGrey,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            40.heightSB,
            AppButton(
              onPressed: () {
                Navigator.of(context).push(ChooseModePage.route());
              },
              label: "Get Started",
            ),
          ],
        ),
      ),
    );
  }
}
