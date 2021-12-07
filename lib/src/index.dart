import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import './constants/theme.dart';
import './providers/index.dart';
import './services/generate_route.dart';

import './auth_wrapper.dart';

import './screens/splash.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final providers = AppProviders();
  bool _splashLoaded = false;

  void setLoaded() {
    setState(() {
      _splashLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: providers.auth),
        ChangeNotifierProvider.value(value: providers.user),
        ChangeNotifierProvider.value(value: providers.halls),
        ChangeNotifierProvider.value(value: providers.bookings),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        scrollBehavior: const ConstantScrollBehavior(),
        home: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: _splashLoaded
              ? const AuthWrapper()
              : CustomSplash(callback: setLoaded),
        ),
        onGenerateRoute: GenerateRoute.generateRoute,
      ),
    );
  }
}

class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
