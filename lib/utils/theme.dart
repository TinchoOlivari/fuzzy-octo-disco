import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: AppTheme.primaryColor,
    fontFamily: 'Rubik',
  );

  static const MaterialColor primaryColor = MaterialColor(
    0xFF16F581,
    <int, Color>{
      50: Color.fromRGBO(22, 245, 129, .1),
      100: Color.fromRGBO(22, 245, 129, .2),
      200: Color.fromRGBO(22, 245, 129, .3),
      300: Color.fromRGBO(22, 245, 129, .4),
      400: Color.fromRGBO(22, 245, 129, .5),
      500: Color.fromRGBO(22, 245, 129, .6),
      600: Color.fromRGBO(22, 245, 129, .7),
      700: Color.fromRGBO(22, 245, 129, .8),
      800: Color.fromRGBO(22, 245, 129, .9),
      900: Color.fromRGBO(22, 245, 129, 1),
    },
  );
  static const Color grey = Color(0xFF686968);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1C1C1E);
  static const Color backgroundColor = Color(0xFF1e1e1e);
}
