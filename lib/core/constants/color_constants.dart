import 'package:flutter/material.dart';

class ColorConstants {
  static final _instance = ColorConstants._internal();
  factory ColorConstants() => _instance;
  ColorConstants._internal();
  final generalColor = Colors.deepOrange;
  final titleTextColor = Colors.white;
  final enabledColor = Colors.black;
  final textFieledLabelColor = Colors.black;
}
