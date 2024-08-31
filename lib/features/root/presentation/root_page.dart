import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (_) => const RootPage(),
      );

  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Root Page'),
      ),
    );
  }
}
