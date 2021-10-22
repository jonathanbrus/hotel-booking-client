import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import './constants/theme.dart';
import './providers/index.dart';
import './services/generate_route.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final providers = AppProviders();
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
        title: "AT Mahal",
        theme: theme,
        initialRoute: "/",
        onGenerateRoute: GenerateRoute.generateRoute,
      ),
    );
  }
}
