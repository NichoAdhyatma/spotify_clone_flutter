import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleBlurButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String image;

  const CircleBlurButton({
    super.key,
    this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xff30393c).withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                image,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}