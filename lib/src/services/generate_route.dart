import 'package:flutter/material.dart';

import '../screens/home.dart';

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args =  settings.arguments;

    switch (settings.name) {
      case Home.routeName:
        return MaterialPageRoute(builder: (BuildContext ctx) => const Home());

      default:
        return MaterialPageRoute(builder: (BuildContext ctx) => const Home());
    }
  }
}
