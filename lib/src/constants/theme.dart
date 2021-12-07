import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  colorScheme: colorScheme,
  appBarTheme: const AppBarTheme(centerTitle: false),
  scaffoldBackgroundColor: colorScheme.background,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xffFBFAF5),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xffFBFAF5),
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CustomRouteTransitionBuilder(),
      TargetPlatform.iOS: CustomRouteTransitionBuilder(),
    },
  ),
);

const ColorScheme colorScheme = ColorScheme(
  primary: Color(0xffFE0000),
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

// custom animation for named routes

class CustomRouteTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
