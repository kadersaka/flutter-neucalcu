import 'package:flutter/material.dart';

class AppColors {
  static const int _red = 33;
  static const int _green = 33;
  static const int _blue = 33;
  static const double _opacity= 1.0;
  static const int _brightness = 25;

  static const Color primary = Color.fromRGBO(_red, _green, _blue, 1);
  static const Color primaryLight = Color.fromRGBO(
    (_red + _brightness),
    (_green + _brightness),
    (_blue + _brightness),
    _opacity,
  );
  static const Color primaryDark = Color.fromRGBO(
    (_red - _brightness),
    (_green - _brightness),
    (_blue - _brightness),
    _opacity,
  );

  static const Color primaryText = Colors.white;
  static const Color secondaryText = Colors.white38;
  static const Color accent = Colors.amberAccent;
  static const Color danger = Colors.redAccent;
}
