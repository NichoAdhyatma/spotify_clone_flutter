import 'package:flutter/material.dart';

class IntroLayout extends StatelessWidget {
  final Widget child;
  final String? image;

  const IntroLayout({super.key, required this.child, this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 40,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image ?? ''),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.15),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 40,
          ),
          child: child,
        ),
      ],
    );
  }
}
