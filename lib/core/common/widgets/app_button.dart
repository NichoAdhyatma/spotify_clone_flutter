import 'package:flutter/material.dart';
import 'package:spotify_clone/core/theme/app_pallete.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? label;
  final double? height;

  const AppButton({super.key, this.onPressed, this.label, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      child: Text(
        label ?? '',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppPallete.textWhite,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
      ),
    );
  }
}
