import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  })  : _controller = controller,
        _hintText = hintText,
        _obscureText = obscureText;

  final TextEditingController _controller;
  final String _hintText;
  final bool _obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: _hintText,
      ),
    );
  }
}
