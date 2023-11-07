import 'package:flutter/material.dart';

class AppThemeText {
  AppThemeText._();

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline1    96.0  light   -1.5
  /// headline2    60.0  light   -0.5
  /// headline3    48.0  regular  0.0
  /// headline4    34.0  regular  0.25
  /// headline5    24.0  regular  0.0
  /// headline6    20.0  medium   0.15
  /// subtitle1    16.0  regular  0.15
  /// subtitle2    14.0  medium   0.1
  /// body1        16.0  regular  0.5   (bodyText1)
  /// body2        14.0  regular  0.25  (bodyText2)
  /// button       14.0  medium   1.25
  /// caption      12.0  regular  0.4
  /// overline     10.0  regular  1.5
  static final themeText = TextTheme(
    headline1: TextStyle(
        fontSize: 96.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontFamily: 'Helvetica Neue'),
    headline2: TextStyle(
        fontSize: 60.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'Helvetica Neue'),
    headline3: TextStyle(
        fontSize: 48.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontFamily: 'Helvetica Neue'),
    headline4: TextStyle(
        fontSize: 34.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontFamily: 'Helvetica Neue'),
    headline5: TextStyle(
        fontSize: 24.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontFamily: 'Helvetica Neue'),
    headline6: TextStyle(
        fontSize: 20.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontFamily: 'Helvetica Neue'),
    subtitle1: TextStyle(
        fontSize: 18.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'Helvetica Neue'),
    subtitle2: TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'Helvetica Neue'),
    bodyText1: TextStyle(
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontFamily: 'Helvetica Neue'),
    bodyText2: TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontFamily: 'Helvetica Neue'),
    button: TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontFamily: 'Helvetica Neue'),
    caption: TextStyle(
        fontSize: 12.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontFamily: 'Helvetica Neue'),
    overline: TextStyle(
        fontSize: 10.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontFamily: 'Helvetica Neue'),
    // sidelabel: TextStyle(
    //     fontSize: 10.0,
    //     fontStyle: FontStyle.normal,
    //     fontWeight: FontWeight.normal,
    //     fontFamily: 'Helvetica Neue'),
  );
}
