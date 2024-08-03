import 'package:flutter/material.dart';

class ColorConstants {
  static final _instance = ColorConstants._internal();
  factory ColorConstants() => _instance;
  ColorConstants._internal();
  final generalColor = const Color(0xFFee403c);
  final titleTextColor = Colors.white;
  final enabledColor = Colors.black;
  final textFieledLabelColor = Colors.black;
  final enabledBorder = Colors.grey;
  final focusedBorder = Colors.black;
  final errorBorder = const Color(0xFFee403c);
  final errorBorderGeneralColor = Colors.yellow;
}
