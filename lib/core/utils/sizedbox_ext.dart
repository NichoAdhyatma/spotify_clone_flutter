import 'package:flutter/material.dart';

extension SizedboxExt on int {
  Widget get heightSB => SizedBox(height: toDouble());
  Widget get widthSB => SizedBox(width: toDouble());
}