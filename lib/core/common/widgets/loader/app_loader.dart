import 'package:flutter/material.dart';
import 'package:spotify_clone/core/theme/app_pallete.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppPallete.primary,
      ),
    );
  }
}
