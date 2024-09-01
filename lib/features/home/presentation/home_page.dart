import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/core/common/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_clone/core/theme/app_pallete.dart';
import 'package:spotify_clone/core/utils/sizedbox_ext.dart';
import 'package:spotify_clone/generated/assets.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (_) => const HomePage(),
      );

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideLeading: true,
        title: SvgPicture.asset(
          Assets.imagesAppLogo,
          width: 40,
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _homeTopCard(),
            40.heightSB,
            _tabBar(),
          ],
        ),
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: AppPallete.primary,
      labelColor: AppPallete.primary,
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: Colors.transparent,
      labelPadding: const EdgeInsets.only(bottom: 4),
      indicatorWeight: 1,
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppPallete.primary,
            width: 2,
          ),
        ),
      ),
      labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
      tabs: const [
        Text(
          "News",
        ),
        Text(
          "Videos",
        ),
        Text(
          "Artists",
        ),
        Text(
          "Podcasts",
        ),
      ],
    );
  }

  SizedBox _homeTopCard() {
    return SizedBox(
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              Assets.vectorsHomeTopCard,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Image.asset(
                Assets.imagesBillieEilish,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
