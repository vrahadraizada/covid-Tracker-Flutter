import 'package:flutter/material.dart';

final kTheme = ThemeData(
  primaryColor: Colors.grey[900],
  accentColor: Colors.white,
  scaffoldBackgroundColor: Colors.white70,
  brightness: Brightness.dark,
  fontFamily: 'Acme',
  cardColor: Colors.grey[900],
);

final kCardShape = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(20),
);

final kBottomCardShap = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
);
