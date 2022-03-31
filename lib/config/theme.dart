import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: Colors.black,
        fontSize: 32,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    headline2: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.normal),
    bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 10,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.normal),
  );
}
