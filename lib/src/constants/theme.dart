import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  colorScheme: colorScheme,
  scaffoldBackgroundColor: colorScheme.background,
  // pageTransitionsTheme: PageTransitionsTheme(
  //   builders: {
  //     TargetPlatform.android: CustomRouteTransitionBuilder(),
  //     TargetPlatform.iOS: CustomRouteTransitionBuilder(),
  //   },
  // ),
);

const ColorScheme colorScheme = ColorScheme(
  primary: Color(0xffc50707),
  primaryVariant: Color(0xff4f0303),
  onPrimary: Color(0xffffffff),
  secondary: Color(0xff212121),
  secondaryVariant: Color(0xff000000),
  onSecondary: Color(0xff000000),
  surface: Color(0xffffffff),
  onSurface: Color(0xff000000),
  background: Color(0xffffffff),
  onBackground: Color(0xff000000),
  error: Color(0xffc30000),
  onError: Color(0xff000000),
  brightness: Brightness.light,
);
